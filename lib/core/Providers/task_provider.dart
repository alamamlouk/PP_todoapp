import 'package:flutter/material.dart';

import '../Entity/Task.dart';

class TaskProvider extends ChangeNotifier{
  List<Task> _tasks=[];
  List<Task> get tasks=>_tasks;
  void setTasks(List<Task> tasks) {
    _tasks = tasks;
    notifyListeners();
  }
  void add(Task task){
    _tasks.add(task);
    notifyListeners();
  }
  void updateTaskStatus(String taskId,String status){
     int index= _tasks.indexWhere((task) => task.taskId==taskId);
     if(index!=-1){
       _tasks[index].status=status;
       notifyListeners();
     }
  }
  Task getTaskById(String taskId) {
    return _tasks.firstWhere((task) => task.taskId == taskId, orElse: () => Task(taskId: "-1", taskName: 'Task not found', taskDescription: 'not found'));
  }
  void removeTask(String taskId){
    _tasks.remove(_tasks.firstWhere((element) => element.taskId==taskId));
    notifyListeners();
  }
  void updateTask(Task task){
    int index=_tasks.indexWhere((element) => element.taskId==task.taskId);
    if(index!=-1){
      _tasks[index]=task;
      notifyListeners();
    }
  }
}