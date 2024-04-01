import 'package:todo_app/core/Entity/Task.dart';

class SubTask{
  final String? subTaskId;
  final String subTaskName;
  final String subTaskDescription;

  final DateTime subTaskFinishedOn;
  final DateTime subTaskCreatedDate;
  String status;
  final Task task;

  SubTask({
    this.subTaskId,
    required this.subTaskName,
    required this.subTaskDescription,
    required this.subTaskFinishedOn,
    required this.subTaskCreatedDate,
    required this.task,
    this.status = 'TODO',



});
  factory SubTask.fromJson(Map<String, dynamic> json) {
    return SubTask(
      subTaskId: json['subTaskId'],
      subTaskName: json['subTaskName'],
      subTaskDescription: json['subTaskDescription'],
      subTaskFinishedOn: DateTime.parse(json['subTaskFinishedOn']),
      subTaskCreatedDate: DateTime.parse(json['subTaskCreatedDate']),
      status: json['status'],
      task: Task.fromJson(json['task']),
    );
  }

  Map<String, dynamic> toJson() => {
    'subTaskId': subTaskId,
    'subTaskName': subTaskName,
    'subTaskDescription': subTaskDescription,
    'subTaskFinishedOn': subTaskFinishedOn.toIso8601String(),
    'subTaskCreatedDate': subTaskCreatedDate.toIso8601String(),
    'status': status,
    'task': task.toJson(),
  };




}