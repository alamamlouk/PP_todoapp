import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/DTO/SubTaskDTO.dart';
import 'package:todo_app/core/Entity/sub_task.dart';
import 'package:todo_app/core/Shared/services/CategoryService/sub_task_services.dart';

import '../../../../core/Providers/task_provider.dart';

class SubTaskItem extends StatefulWidget {
  final String taskId;
  final SubTask subTask;
  const SubTaskItem({Key? key, required this.subTask, required this.taskId})
      : super(key: key);

  @override
  State<SubTaskItem> createState() => _SubTaskItemState();
}

class _SubTaskItemState extends State<SubTaskItem> {
  bool isChecked = false;
  final SubTaskServices _subTaskServices = SubTaskServices();
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.subTask.status == "DONE") {
      isChecked = true;
    }
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.subTask.subTaskName),
                Text(widget.subTask.subTaskDescription)
              ],
            ),
          ),
          IgnorePointer(
            ignoring: widget.subTask.status == "DONE",
            child: Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) async {
                setState(() {
                  isChecked = value!;
                  widget.subTask.status = "DONE";
                });
                SubTaskDTO subTaskDTO =
                SubTaskDTO(taskId: widget.taskId, subTask: widget.subTask);
                int progress = await _subTaskServices.updateSubTaskProgress(subTaskDTO);
                Provider.of<TaskProvider>(context, listen: false).updateTaskProgress(progress,widget.taskId);
              },
            ),
          )

        ],
      ),
    );
  }
}
