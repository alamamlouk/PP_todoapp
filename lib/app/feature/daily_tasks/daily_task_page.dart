import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/Entity/Task.dart';
import '../../../core/Providers/task_provider.dart';
import 'daily_task_item_widget.dart';

class DailyTaskPage extends StatelessWidget {
  const DailyTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Tasks"),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          if (taskProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (taskProvider.getOnlyDailyTasks().isEmpty) {
            return const Center(
              child: Text("No Daily task  found"),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                //await _refreshData(taskProvider); // Pass taskProvider here
              },
              child: ListView.builder(
                itemCount:taskProvider.getOnlyDailyTasks().length,
                itemBuilder: (BuildContext context, int index) {
                  return DailyTaskItemWidget(dailyTask: taskProvider.getOnlyDailyTasks()[index],);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
