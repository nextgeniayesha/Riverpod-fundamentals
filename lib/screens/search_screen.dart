import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/fruit_search_provider.dart';
import '../widgets/next_previous_bar.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The list watches only ONE provider: the mixed one.
    // filteredFruitsProvider already combines the fruits + the search text.
    final fruits = ref.watch(filteredFruitsProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Combine providers'),
      ),
      bottomNavigationBar: const NextPreviousBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search fruits',
                border: OutlineInputBorder(),
              ),
              // Typing only changes provider 2 (the search text).
              onChanged: (value) =>
                  ref.read(searchProvider.notifier).state = value,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: fruits.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(fruits[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
