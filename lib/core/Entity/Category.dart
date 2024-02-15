import 'Task.dart';

class Category{
  String ?categoryId,categoryName;
  List<Task> ?taskList;

  Category({this.categoryId, this.categoryName, this.taskList});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'] as String,
      categoryName: json['categoryName'] as String,
    );
  }
}