import 'package:flutter/material.dart';

import '../Entity/Task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  bool _isLoading = false;

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;

  void setTasks(List<Task> tasks) {
    _tasks = tasks;
    _tasks.sort((a, b) => b.taskCreatedDate.compareTo(a.taskCreatedDate));
    notifyListeners();
  }
  void setIsLoading(bool loading){
    _isLoading=loading;
    notifyListeners();
  }

  void add(Task task) {
    _tasks.add(task);
    _tasks.sort((a, b) => b.taskCreatedDate.compareTo(a.taskCreatedDate));
    notifyListeners();
  }

  void updateTaskStatus(String taskId, String status) {
    int index = _tasks.indexWhere((task) => task.taskId == taskId);
    if (index != -1) {
      _tasks[index].status = status;
      notifyListeners();
    }
  }

  Task getTaskById(String taskId) {
    return _tasks.firstWhere((task) => task.taskId == taskId,
        orElse: () => Task(
            taskId: "-1",
            taskName: 'Task not found',
            taskDescription: 'not found'));
  }

  void removeTask(String taskId) {
    _tasks.remove(_tasks.firstWhere((element) => element.taskId == taskId));
    notifyListeners();
  }

  void updateTask(Task task) {
    int index = _tasks.indexWhere((element) => element.taskId == task.taskId);
    if (index != -1) {
      _tasks[index] = task;
      notifyListeners();
    }
  }
  void updateTaskProgress(int progress,String taskId){
    int index = _tasks.indexWhere((element) => element.taskId == taskId);
    if (index != -1) {
      _tasks[index].percentage = progress;
      notifyListeners();
    }
  }
  List<Task> getOnlyDailyTasks() {
    return _tasks.where((task) => task.dailyTask == true).toList();
  }
  List<Task> getOnlyTasksWithNoSubTasks(){
      return _tasks.where((task)=> task.subTasks == null).toList();
  }
  List<Task> getNoneDailyTasks(){
    return _tasks.where((task)=> task.dailyTask== false).toList();
  }

}
