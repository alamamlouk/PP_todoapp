import 'package:flutter/material.dart';
import 'package:todo_app/core/Entity/Task.dart';

import '../HomePageWidgets/BoxWithIconAndText .dart';
import '../HomePageWidgets/TaskListItem.dart';
import '../Services/task_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [];
  TaskService _taskService = TaskService();

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                  radius: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Hello Ala"),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BoxWithIconAndText(
                    icon: Icons.replay_circle_filled_rounded,
                    text: 'Daily Tasks',
                    backgroundColor: Colors.blue),
                BoxWithIconAndText(
                    icon: Icons.timelapse_outlined,
                    text: 'On going',
                    backgroundColor: Colors.orange),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BoxWithIconAndText(
                    icon: Icons.fact_check_sharp,
                    text: 'Completed',
                    backgroundColor: Colors.green),
                BoxWithIconAndText(
                    icon: Icons.delete_forever_outlined,
                    text: 'Canceled',
                    backgroundColor: Colors.red),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Task>>(
              future: _taskService.fetchTasks(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  tasks = snapshot.data!;
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TaskListItem(task: tasks[index]);
                    },
                  );
                }
              },
            ),
          )
        ],

    );
  }
}
