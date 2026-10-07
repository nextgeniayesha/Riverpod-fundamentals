// One row in the todo list.
class TodoItem {
  const TodoItem({
    required this.id,
    required this.title,
    this.done = false,
  });

  final String id;
  final String title;
  final bool done;

  // copyWith = make a NEW todo, change only the fields you pass.
  TodoItem copyWith({
    String? id,
    String? title,
    bool? done,
  }) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      done: done ?? this.done,
    );
  }
}
