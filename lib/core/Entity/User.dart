import 'Task.dart';

class TodoUser {
  late final String todoUserId;
  late final String email;
  late final String name;
  late final List<Task> tasks;

  TodoUser({
    required this.todoUserId,
    required this.email,
    required this.name,
    required this.tasks,
  });

  factory TodoUser.fromJson(Map<String, dynamic> json) {
    // Assuming 'tasks' is a list of JSON objects representing tasks
    final List<dynamic> jsonTasks = json['tasks'] ?? [];
    final List<Task> taskList =
        jsonTasks.map((task) => Task.fromJson(task)).toList();

    return TodoUser(
      todoUserId: json['todoUser_id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      tasks: taskList,
    );
  }
}
