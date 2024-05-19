import 'package:todo_app/core/Entity/sub_task.dart';

import '../../../../core/Entity/task.dart';

int numberOfCompleteSubTask(Task task){
  int numberOfCompleteSubTasks=0;
  for(SubTask subTask in task.subTasks!){
    if(subTask.status=="DONE"){
      numberOfCompleteSubTasks++;
    }
  }
  return numberOfCompleteSubTasks;
}