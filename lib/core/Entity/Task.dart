import 'Category.dart';

class Task {
  final String taskId;
  final String taskName;
  final String taskDescription;
  final DateTime taskCreatedDate;
  final DateTime taskFinishedDate;
  final DateTime taskStartTime;
  final DateTime taskEndTime;
  final String status;
  final int percentage;
  final Category category;


  Task({
    required this.taskId,
    required this.taskName,
    required this.taskDescription,
    required this.taskCreatedDate,
    required this.taskFinishedDate,
    required this.taskStartTime,
    required this.taskEndTime,
    required this.status,
    required this.percentage,

    required this.category,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskId: json['task_id'] as String,
      taskName: json['taskName'] as String,
      taskDescription: json['taskDescription'] as String,
      taskCreatedDate: DateTime.parse(json['taskCreatedDate']),
      taskFinishedDate: DateTime.parse(json['taskFinishedDate']),
      taskStartTime: DateTime.parse(json['taskStartTime']),
      taskEndTime: DateTime.parse(json['taskEndTime']),
      status: json['status'] as String,
      percentage: json['percentage'] as int,
      category:  Category.fromJson(json['category'])
    );
  }
}