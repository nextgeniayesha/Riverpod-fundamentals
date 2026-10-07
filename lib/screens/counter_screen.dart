import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/counter_provider.dart';
import '../widgets/next_previous_bar.dart';
import 'profile_screen.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch = SHOW the value. This screen rebuilds when count changes.
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('StateProvider'),
      ),
      bottomNavigationBar: const NextPreviousBar(next: ProfileScreen()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$count',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  // read = DO an action (inside a click, never watch).
                  onPressed: () => ref.read(counterProvider.notifier).state++,
                  child: const Text('+'),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () => ref.read(counterProvider.notifier).state--,
                  child: const Text('−'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
