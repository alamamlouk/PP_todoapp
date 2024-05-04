import 'package:flutter/material.dart';
import 'package:todo_app/app/feature/CanceledTasks/canceled_tasks.dart';
import 'package:todo_app/app/feature/OnGoingTasks/on_going_tasks.dart';
import 'package:todo_app/app/feature/completedTasks/completed_tasks.dart';
import 'package:todo_app/app/feature/daily_tasks/daily_task_page.dart';

import 'BoxWithIconAndText .dart';

class TaskStatus extends StatefulWidget {
  const TaskStatus({Key? key}) : super(key: key);

  @override
  _TaskStatusState createState() => _TaskStatusState();
}

class _TaskStatusState extends State<TaskStatus> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BoxWithIconAndText(
                  icon: Icons.replay_circle_filled_rounded,
                  text: 'Daily Tasks',
                  backgroundColor: Colors.blue,
                  pageToNavigateTo: DailyTaskPage(),),
              BoxWithIconAndText(
                  icon: Icons.timelapse_outlined,
                  text: 'On going',
                  backgroundColor: Colors.orange, pageToNavigateTo: OnGoingTasks(),),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BoxWithIconAndText(
                  icon: Icons.fact_check_sharp,
                  text: 'Completed',
                  backgroundColor: Colors.green, pageToNavigateTo: CompletedTasks(),),
              BoxWithIconAndText(
                  icon: Icons.delete_forever_outlined,
                  text: 'Canceled',
                  backgroundColor: Colors.red, pageToNavigateTo: CanceledTasks(),),
            ],
          ),
        ),
      ],
    );
  }
}
