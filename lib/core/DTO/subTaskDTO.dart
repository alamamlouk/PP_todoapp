import 'package:todo_app/core/Entity/sub_task.dart';

class SubTaskDTO {
  final String taskId;
  final SubTask subTask;

  SubTaskDTO({required this.taskId, required this.subTask});
  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId,
      'subTask': subTask,
    };
  }
}
