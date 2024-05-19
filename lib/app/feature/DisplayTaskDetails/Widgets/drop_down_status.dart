import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/DTO/task_update_request.dart';
import '../../../../core/Enum/status.dart';
import '../../../../core/Providers/task_provider.dart';
import '../../../../core/Shared/services/global_task_services.dart';

class DropDownStatus extends StatefulWidget {
  final String taskId;
  final String status;
  const DropDownStatus({Key? key, required this.taskId, required this.status}) : super(key: key);

  @override
  _DropDownStatusState createState() => _DropDownStatusState();
}

class _DropDownStatusState extends State<DropDownStatus> {
  GlobalTaskServices globalTaskServices = GlobalTaskServices();
  late TaskProvider taskProvider;
  late Status selectedStatus;
  @override
  void initState() {
    taskProvider = Provider.of<TaskProvider>(context, listen: false);
    selectedStatus = Status.values.firstWhere(

            (e) => e.toString().toUpperCase() == 'STATUS.${widget.status}');
    super.initState();


  }
  void updateTaskState(Status newValue){
    TaskUpdateRequest newTask = TaskUpdateRequest(
        taskId: widget.taskId, newStatus: newValue);
    globalTaskServices.updateTaskStatus(newTask);
    taskProvider.updateTaskStatus(newTask.taskId, newValue.toString().split('.')[1]);
  }

  @override
  Widget build(BuildContext context) {

    return DropdownButton<Status>(
      value: selectedStatus,
      items: Status.values.map((Status status) {
        return DropdownMenuItem<Status>(
          value: status,
          child: Text(status.formattedString),
        );
      }).toList(),
      onChanged: (Status? newValue) {
        if (newValue != null) {
          updateTaskState(newValue);
          setState(() {

            selectedStatus = newValue;
          });
        }
      },
    );
  }
}
