import '../../../../core/Entity/task.dart';
import '../../../../core/Entity/sub_task.dart';

class TaskDto {
  final String todoUserId,categoryId;
  final Task task;
  List<SubTask>? subTasks;

  TaskDto(
      {required this.todoUserId,
        required this.task,
        required this.categoryId,
        this.subTasks,
      });
  Map<String, dynamic> toJson() {
    return {
      'todoUserId': todoUserId,
      'categoryId': categoryId,
      'task': task.toJson(),
      'subTasks': subTasks?.map((subTask) => subTask.toJson()).toList(),

    };
  }
}
