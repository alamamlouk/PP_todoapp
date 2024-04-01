import '../Entity/task_category.dart';

class FetchRecentTaskDTO {
  final String taskId;
  final String taskName;
  final String taskDescription;
  final String status;
  final TaskCategory category;

  FetchRecentTaskDTO(
      {required this.taskId,
      required this.taskName,
      required this.taskDescription,
      required this.status,
      required this.category});

  factory FetchRecentTaskDTO.fromJson(Map<String, dynamic> json) {
    return FetchRecentTaskDTO(
        taskId: json['task_id'] as String,
        taskName: json['taskName'] as String,
        taskDescription: json['taskDescription'] as String,
        status: json['status'] as String,
        category: TaskCategory.fromJson(json['category']));
  }
}
