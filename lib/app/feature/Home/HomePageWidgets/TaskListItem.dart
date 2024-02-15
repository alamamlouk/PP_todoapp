import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../core/Entity/Task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  TaskListItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Customize the appearance of the card as needed
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(

        title: Text(
          task.taskName,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text('${task.category.categoryName}'),
            const Spacer(),
            CircularPercentIndicator(
              radius: 20.0,
              lineWidth: 3.0,
              animation: true,
              percent: task.percentage.toDouble()/100,
              center: Text(
                '${task.percentage} %',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize:10.0),
              ),

              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
            ),
          ],
        ),

      ),
    );
  }
}