import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/stream_provider.dart';
import '../widgets/next_previous_bar.dart';
import 'posts_api_screen.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(tickerProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('StreamProvider'),
      ),
      bottomNavigationBar: const NextPreviousBar(next: PostsApiScreen()),
      body: Center(
        // Same .when as FutureProvider. data runs again on every new number.
        child: streamData.when(
          skipLoadingOnRefresh: false,
          loading: () => const CircularProgressIndicator(),
          error: (error, _) => Text('Error: $error'),
          data: (tick) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$tick',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 16),
              FilledButton(
                // invalidate = stop this stream and start a new one from 1.
                onPressed: () => ref.invalidate(tickerProvider),
                child: const Text('Invalidate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
