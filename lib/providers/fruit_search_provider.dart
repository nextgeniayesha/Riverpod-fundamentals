import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider 1: all fruits (a fixed list).
final fruitsProvider = Provider<List<String>>((ref) {
  return ['Apple', 'Banana', 'Mango', 'Orange', 'Grapes', 'Watermelon'];
});

// Provider 2: the text the user types in the search box.
final searchProvider = StateProvider<String>((ref) => '');

//Provider 3: Watches both Providers
final filteredFruitsProvider = Provider<List<String>>((ref) {
  final fruits = ref.watch(fruitsProvider);
  final search = ref.watch(searchProvider);
  return fruits
      .where((fruit) => fruit.toLowerCase().contains(search.toLowerCase()))
      .toList();
});
