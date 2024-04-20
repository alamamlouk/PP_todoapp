import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/Providers/task_provider.dart';
import 'TaskListItem.dart';

class RecentTasks extends StatefulWidget {
  const RecentTasks({Key? key}) : super(key: key);

  @override
  _RecentTasksState createState() => _RecentTasksState();
}

class _RecentTasksState extends State<RecentTasks> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          if (taskProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (taskProvider.tasks.isEmpty) {
            return const Center(
              child: Text("No task found"),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                //await _refreshData(taskProvider); // Pass taskProvider here
              },
              child: ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskListItem(task: taskProvider.tasks[index]);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
