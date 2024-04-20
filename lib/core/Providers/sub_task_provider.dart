import 'package:flutter/cupertino.dart';

import '../Entity/sub_task.dart';

class SubTaskProvider extends ChangeNotifier{
  List<SubTask> _subTasks=[];
  List<SubTask> get subTasks=>_subTasks;
  void setSubTasks(List<SubTask> subTasks){
    _subTasks=subTasks;
    notifyListeners();
  }
  void addSubTask(SubTask subTask){
    _subTasks.add(subTask);
    notifyListeners();
  }
  void removeSubTask(String subTaskId){
    _subTasks.remove(_subTasks.firstWhere((element) => element.subTaskId == subTaskId));
    notifyListeners();
  }
  void updateTaskStatus(String subTaskId, String status) {
    int index = _subTasks.indexWhere((subTask) => subTask.subTaskId == subTaskId);
    if (index != -1) {
      _subTasks[index].status = status;
      notifyListeners();
    }
  }
}