import 'dart:core';

import 'package:flutter/cupertino.dart';

import '../Entity/task_category.dart';

class TaskCategoryProvider extends ChangeNotifier{
  List<TaskCategory> _taskCategories=[];
  List<TaskCategory> get taskCategories=>_taskCategories;
  void setTaskCategory(List<TaskCategory> taskCategories){
    _taskCategories=taskCategories;
    notifyListeners();
  }
  void add(TaskCategory taskCategory){
    _taskCategories.add(taskCategory);
    notifyListeners();
  }
  void deleteCategory(TaskCategory taskCategory){
    _taskCategories.remove(taskCategory);
    notifyListeners();
  }
  void updateCategory(TaskCategory updatedCategory) {
    final index =
    _taskCategories.indexWhere((category) => category.categoryId == updatedCategory.categoryId);
    if (index != -1) {
      _taskCategories[index] = updatedCategory;
      notifyListeners();
    }
  }


}