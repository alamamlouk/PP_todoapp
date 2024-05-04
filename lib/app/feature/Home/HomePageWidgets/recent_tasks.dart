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
          } else if (taskProvider.getNoneDailyTasks().isEmpty) {
            return const Center(
              child: Text("No task found"),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                //await _refreshData(taskProvider);
              },
              child: ListView.builder(
                itemCount: taskProvider.getNoneDailyTasks().length > 4 ? 4 : taskProvider.getNoneDailyTasks().length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskListItem(task: taskProvider.getNoneDailyTasks()[index]);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
