import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/notifier_provider_todo.dart';
import '../widgets/next_previous_bar.dart';
import 'future_screen.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch = the current todo list. Rebuilds after add / toggle / remove.
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('StateNotifierProvider'),
      ),
      bottomNavigationBar: const NextPreviousBar(next: FutureScreen()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addDialog(context, ref),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final item = todos[index];
          return ListTile(
            // The UI only calls notifier methods. All logic is in TodoNotifier.
            leading: Checkbox(
              value: item.done,
              onChanged: (_) =>
                  ref.read(todoProvider.notifier).toggle(item.id),
            ),
            title: Text(
              item.title,
              style: TextStyle(
                decoration: item.done ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () =>
                      _renameDialog(context, ref, item.id, item.title),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () =>
                      ref.read(todoProvider.notifier).remove(item.id),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _addDialog(BuildContext context, WidgetRef ref) async {
    final text = await _textDialog(context, 'New todo', '');
    if (text != null) {
      ref.read(todoProvider.notifier).add(text);
    }
  }

  Future<void> _renameDialog(
    BuildContext context,
    WidgetRef ref,
    String id,
    String current,
  ) async {
    final text = await _textDialog(context, 'Rename', current);
    if (text != null) {
      ref.read(todoProvider.notifier).rename(id, text);
    }
  }

  Future<String?> _textDialog(
    BuildContext context,
    String title,
    String initial,
  ) {
    final controller = TextEditingController(text: initial);
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
