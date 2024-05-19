import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_app/app/feature/DisplayTaskDetails/Screren/task_details.dart';
import 'package:todo_app/app/feature/Home/HomePageWidgets/status_widget.dart';

import '../../../../core/Entity/task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  const TaskListItem({Key? key, required this.task}) : super(key: key);

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
              MaterialPageRoute(builder: (context) => TaskDetails(task: task)),
            );
          } catch (error) {
          }
        },
        title: Text(
          task.taskName,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.category!.categoryName,
              style: const TextStyle(color: Colors.grey),
            ),
            if (task.subTasks != null && task.subTasks!.isNotEmpty)
              Row(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    size: 20,
                  ),
                  Text(
                    " ${task.subTasks!.length} subTasks",
                    style: const TextStyle(color: Colors.black87),
                  )
                ],
              )
          ],
        ),
        trailing: task.subTasks!.isEmpty
            ? StatusWidget(status: task.status)
            : CircularPercentIndicator(
                radius: 20.0,
                lineWidth: 3.0,
                animation: true,
                percent: task.percentage.toDouble() / 100,
                center: Text(
                  '${task.percentage} %',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 10.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.purple,
              ),
      ),
    );
  }
}
