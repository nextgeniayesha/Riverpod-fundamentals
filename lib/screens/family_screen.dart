import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/posts_provider.dart';
import '../widgets/next_previous_bar.dart';
import 'search_screen.dart';

// Which post id the slider picked (normal StateProvider, not family).
final selectedPostIdProvider = StateProvider<int>((ref) => 1);

class FamilyScreen extends ConsumerWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedPostIdProvider);
    // family: pass the id like a function parameter.
    final async = ref.watch(postByIdProvider(id));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('.family'),
      ),
      bottomNavigationBar: const NextPreviousBar(next: SearchScreen()),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Post id: $id'),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: '$id',
              value: id.toDouble(),
              onChanged: (value) {
                ref.read(selectedPostIdProvider.notifier).state = value.round();
              },
            ),
            const SizedBox(height: 12),
            Expanded(
              child: async.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Text('$error'),
                data: (post) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      children: [
                        Text(
                          post.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        Text(post.body),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
