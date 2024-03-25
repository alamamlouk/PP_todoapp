import '../../../../core/Entity/Task.dart';

class TaskDto{
  final String todoUserId;
  final String categoryId;
  final Task task;

  TaskDto({
   required this.todoUserId,
   required this.task,
   required this.categoryId
});
  Map<String, dynamic> toJson() {
    return {
      'todoUserId': todoUserId,
      'categoryId': categoryId,
      'task': task.toJson(),
    };
  }

}