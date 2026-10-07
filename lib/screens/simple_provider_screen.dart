import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/name_provider.dart';
import '../widgets/next_previous_bar.dart';
import 'counter_screen.dart';

// ConsumerWidget = StatelessWidget + ref (so we can use providers).
class SimpleProviderScreen extends ConsumerWidget {
  const SimpleProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(presenterNameProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Provider'),
      ),
      bottomNavigationBar: const NextPreviousBar(next: CounterScreen()),
      body: Center(
        child: Text(
          name,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
