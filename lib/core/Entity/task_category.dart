import 'task.dart';

class TaskCategory {
  String categoryId, categoryName;
  List<Task>? taskList;

  TaskCategory(
      {required this.categoryId,
        required this.categoryName,
        this.taskList});
  factory TaskCategory.fromJson(Map<String, dynamic> json) {
    return TaskCategory(
      categoryId: json['category_id'] as String,
      categoryName: json['categoryName'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'categoryName': categoryName,
    };
  }
}
