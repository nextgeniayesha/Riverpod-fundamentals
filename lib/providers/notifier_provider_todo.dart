import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo_item.dart';

// Notifier class = holds the state (the todo list)
// and has methods to change it (add, toggle, rename, remove).
class TodoNotifier extends StateNotifier<List<TodoItem>> {
  TodoNotifier()
      : super(const [
          TodoItem(id: '1', title: 'Learn Riverpod'),
          TodoItem(id: '2', title: 'Prepare slides'),
        ]);

  void add(String title) {
    final item = TodoItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title.trim(),
    );
    if (item.title.isEmpty) return;
    state = [...state, item];
  }

  void toggle(String id) {
    state = [
      for (final item in state)
        if (item.id == id) item.copyWith(done: !item.done) else item,
    ];
  }

  void rename(String id, String title) {
    state = [
      for (final item in state)
        if (item.id == id) item.copyWith(title: title) else item,
    ];
  }

  void remove(String id) {
    state = state.where((item) => item.id != id).toList();
  }
}


final todoProvider =
    StateNotifierProvider<TodoNotifier, List<TodoItem>>((ref) {
  return TodoNotifier();
});
