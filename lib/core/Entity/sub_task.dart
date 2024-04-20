import 'package:todo_app/core/Entity/Task.dart';

class SubTask{
  final String? subTaskId;
  final String subTaskName;
  final String subTaskDescription;
  dynamic subTaskFinishedOn;
  DateTime? subTaskCreatedDate;
  String status;
  Task? task;

  SubTask({
    this.subTaskId,
    required this.subTaskName,
    required this.subTaskDescription,
    this.subTaskFinishedOn,
    this.subTaskCreatedDate,
    this.task,
    this.status = 'TODO',



});
  factory SubTask.fromJson(Map<String, dynamic> json) {
    return SubTask(
      subTaskId: json['subTaskId'],
      subTaskName: json['subTaskName'],
      subTaskDescription: json['subTaskDescription'],
      subTaskFinishedOn: json['subTaskFinishedOn']!=null?DateTime.parse(json['subTaskFinishedOn']):null,
      subTaskCreatedDate: DateTime.parse(json['subTaskModificationDate']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
    'subTaskId': subTaskId,
    'subTaskName': subTaskName,
    'subTaskDescription': subTaskDescription,
    'subTaskFinishedOn': subTaskFinishedOn?.toIso8601String(),
    'subTaskModificationDate': subTaskCreatedDate?.toIso8601String(),
    'status': status,
  };




}