import 'package:todo_app/core/Entity/sub_task.dart';

import 'task_category.dart';

class Task {
  final String? taskId;
  String taskName;
  String taskDescription;
  DateTime taskCreatedDate;
  final dynamic theTimeTheTaskWasFinishedOn;
  final DateTime? whenTheTaskWillStart;
  final DateTime? whenTheTaskWillBeDone;
  String status;
  int percentage;
  TaskCategory? category;
  List<SubTask>? subTasks;
  bool? dailyTask;

  Task({
    this.taskId,
    required this.taskName,
    required this.taskDescription,
    DateTime? taskCreatedDate,
    this.theTimeTheTaskWasFinishedOn,
    this.whenTheTaskWillStart,
    this.whenTheTaskWillBeDone,
    this.status = 'TODO',
    this.percentage = 0,
    this.category,
    this.subTasks,
    this.dailyTask
  }) : taskCreatedDate = taskCreatedDate ?? DateTime.now();

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        taskId: json['task_id'] as String,
        taskName: json['taskName'] as String,
        taskDescription: json['taskDescription']!=null? json['taskDescription'] as String:"",
        taskCreatedDate: DateTime.parse(json['taskCreatedDate']),
        theTimeTheTaskWasFinishedOn: json['theTimeTheTaskWasFinishedOn'] != null
            ? DateTime.parse(json['theTimeTheTaskWasFinishedOn'])
            : "not yet",
        whenTheTaskWillStart:json['whenTheTaskWillStart']!=null? DateTime.parse(json['whenTheTaskWillStart']):null,
        whenTheTaskWillBeDone: json['whenTheTaskWillBeDone']!=null?DateTime.parse(json['whenTheTaskWillBeDone']):null,
        status: json['status'] as String,
        percentage:json['percentage']!=null?json['percentage']  as int:0,
        category: json['category']!=null?TaskCategory.fromJson(json['category']):null,
        subTasks: json['subTaskList'] != null
            ? (json['subTaskList'] as List)
            .map((subTaskJson) => SubTask.fromJson(subTaskJson))
            .toList()
            : <SubTask>[],
        dailyTask: json['dailyTask'],
    );

  }
  Map<String, dynamic> toJson() => {
    'task_id': taskId,
    'taskName': taskName,
    'taskDescription': taskDescription,
    'taskCreatedDate': taskCreatedDate.toIso8601String(),
    'whenTheTaskWillStart': whenTheTaskWillStart?.toIso8601String(),
    'whenTheTaskWillBeDone': whenTheTaskWillBeDone?.toIso8601String(),
    'status': status,
    'percentage': percentage,
    'category': category?.toJson(),
    'subTasks': subTasks?.map((subTask) => subTask.toJson()).toList(),
    'dailyTask':dailyTask
  };
}
