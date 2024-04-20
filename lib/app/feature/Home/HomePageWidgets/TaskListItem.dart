import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/feature/DisplayTaskDetails/Screren/task_details.dart';
import 'package:todo_app/core/DTO/task_update_request.dart';
import 'package:todo_app/core/Shared/services/CategoryService/global_task_services.dart';

import '../../../../core/Entity/Task.dart';
import '../../../../core/Enum/status.dart';
import '../../../../core/Providers/task_provider.dart';

class TaskListItem extends StatefulWidget {
  final Task task;

  const TaskListItem({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  late Status selectedStatus;
  late Task fetchedTask;
  GlobalTaskServices globalTaskServices = GlobalTaskServices();
  late TaskProvider taskProvider;

  @override
  void initState() {
    super.initState();

    taskProvider = Provider.of<TaskProvider>(context, listen: false);
    fetchedTask = taskProvider.getTaskById(widget.task.taskId!);
    selectedStatus = Status.values.firstWhere(
        (e) => e.toString().toUpperCase() == 'STATUS.${widget.task.status}');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: ListTile(
        onTap: () {
          try {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskDetails(task: fetchedTask)),
            );
          } catch (error) {
            print("the error:  ${error.toString()}");
          }
        },
        title: Text(
          widget.task.taskName,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle:  Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: Text(
                widget.task.category!.categoryName,
              ),
            ),
          ],
        ),
        trailing: widget.task.subTasks!.isEmpty?
        DropdownButton<Status>(
          value: selectedStatus,
          items: Status.values.map((Status status) {
            return DropdownMenuItem<Status>(
              value: status,
              child: Text(status.formattedString),
            );
          }).toList(),
          onChanged: (Status? newValue) {
            if (newValue != null) {
              TaskUpdateRequest newTask = TaskUpdateRequest(
                  taskId: widget.task.taskId!, newStatus: newValue);
              globalTaskServices.updateTaskStatus(newTask);
              String statusString =
              newTask.newStatus.toString().split('.')[1];
              statusString = statusString[0].toUpperCase() +
                  statusString.substring(1).toLowerCase();
              statusString = statusString.replaceAll('_', ' ');
              taskProvider.updateTaskStatus(newTask.taskId, statusString);
              setState(() {
                selectedStatus = newValue;
              });
            }
          },
        ):CircularPercentIndicator(
          radius: 20.0,
          lineWidth: 3.0,
          animation: true,
          percent: widget.task.percentage.toDouble()/100,
          center: Text(
            '${widget.task.percentage} %',
            style:
            const TextStyle(fontWeight: FontWeight.bold, fontSize:10.0),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.purple,
        ),
      ),
    );
  }
}
