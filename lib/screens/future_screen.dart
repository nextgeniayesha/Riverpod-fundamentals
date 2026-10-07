import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/future_message_provider.dart';
import '../widgets/next_previous_bar.dart';
import 'stream_screen.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(delayedMessageProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('FutureProvider'),
      ),
      bottomNavigationBar: const NextPreviousBar(next: StreamScreen()),
      body: Center(
        // .when = one widget for each state: loading, error, data.
        child: message.when(
          skipLoadingOnRefresh: false,
          loading: () => const CircularProgressIndicator(),
          error: (error, _) => Text('Error: $error'),
          data: (message) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
              const SizedBox(height: 16),
              FilledButton(
                // invalidate = throw away the saved result and run again.
                onPressed: () => ref.invalidate(delayedMessageProvider),
                child: const Text('Invalidate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
