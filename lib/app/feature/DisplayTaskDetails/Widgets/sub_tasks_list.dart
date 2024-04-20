import 'package:flutter/material.dart';
import 'package:todo_app/app/feature/DisplayTaskDetails/Widgets/sub_task_item.dart';

import '../../../../core/Entity/sub_task.dart';

class SubTasksList extends StatefulWidget {
  final List<SubTask> subTasks;
  final String taskId;
  const SubTasksList({Key? key, required this.subTasks, required this.taskId}) : super(key: key);

  @override
  _SubTasksListState createState() => _SubTasksListState();
}

class _SubTasksListState extends State<SubTasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.subTasks.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: SubTaskItem(subTask: widget.subTasks[index], taskId: widget.taskId,),
        );      },
    );
  }
}
