import '../Entity/task.dart';

class DailyTaskDTO{
  final String todoUserId;
  final Task task;
  DailyTaskDTO({
    required this.todoUserId,
    required this.task
});
  Map<String, dynamic> toJson() {
    return {
      'todoUserId': todoUserId,
      'task': task.toJson(),

    };
  }}