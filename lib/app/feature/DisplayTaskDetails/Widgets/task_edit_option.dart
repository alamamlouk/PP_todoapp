import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskEditOption extends StatelessWidget {
  final String taskId;
  final Function deleteTask;
  final Function editTask;
  const TaskEditOption({Key? key, required this.deleteTask, required this.editTask, required this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
      children: [
        IconButton( onPressed: () {  }, icon: Icon(Icons.copy),),
        IconButton( onPressed: () {editTask();}, icon: Icon(Icons.edit),),
        IconButton( onPressed: () {  }, icon: Icon(Icons.share),),
        IconButton( onPressed: () {deleteTask(taskId);}, icon: Icon(Icons.delete_forever),),
      ],
    );
  }
}
