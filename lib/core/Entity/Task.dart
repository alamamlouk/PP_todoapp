import 'package:todo_app/core/Entity/sub_task.dart';

import 'task_category.dart';

class Task {
  final String? taskId;
  final String taskName;
  final String taskDescription;
  final DateTime taskCreatedDate;
  final dynamic taskFinishedDate;
  final DateTime? taskStartTime;
  final DateTime? taskEndTime;
  String status;
  final int percentage;
  final TaskCategory? category;
  final List<SubTask>? subTasks;

  Task({
    this.taskId,
    required this.taskName,
    required this.taskDescription,
    DateTime? taskCreatedDate,
    this.taskFinishedDate,
    this.taskStartTime,
    this.taskEndTime,
    this.status = 'TODO',
    this.percentage = 0,
    this.category,
    this.subTasks,
  }) : taskCreatedDate = taskCreatedDate ?? DateTime.now();

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        taskId: json['task_id'] as String,
        taskName: json['taskName'] as String,
        taskDescription: json['taskDescription'] as String,
        taskCreatedDate: DateTime.parse(json['taskCreatedDate']),
        taskFinishedDate: json['taskFinishedDate'] != null
            ? DateTime.parse(json['taskFinishedDate'])
            : "not yet",
        taskStartTime: DateTime.parse(json['taskStartTime']),
        taskEndTime: DateTime.parse(json['taskEndTime']),
        status: json['status'] as String,
        percentage: json['percentage'] as int,
        category: TaskCategory.fromJson(json['category']),
        subTasks: json['subTasks'] != null
            ? (json['subTasks'] as List)
            .map((subTaskJson) => SubTask.fromJson(subTaskJson))
            .toList()
            : <SubTask>[]
    );

  }
  Map<String, dynamic> toJson() => {
    'task_id': taskId,
    'taskName': taskName,
    'taskDescription': taskDescription,
    'taskCreatedDate': taskCreatedDate.toIso8601String(),
    'taskStartTime': taskStartTime?.toIso8601String(),
    'taskEndTime': taskEndTime?.toIso8601String(),
    'status': status,
    'percentage': percentage,
    'category': category?.toJson(),
    'subTasks': subTasks?.map((subTask) => subTask.toJson()).toList(),
  };
}
