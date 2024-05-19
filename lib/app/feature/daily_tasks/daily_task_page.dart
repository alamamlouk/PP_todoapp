import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/feature/daily_tasks/Widgets/add_daily_task.dart';
import '../../../core/Providers/task_provider.dart';
import 'Widgets/daily_task_item_widget.dart';

class DailyTaskPage extends StatelessWidget {
  const DailyTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
         _showFormDialog(context);

      },child: const Icon(Icons.add),),
      appBar: AppBar(
        title: const Text("Daily Tasks"),
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
            return ListView.builder(
              itemCount:taskProvider.getOnlyDailyTasks().length,
              itemBuilder: (BuildContext context, int index) {
                return DailyTaskItemWidget(dailyTask: taskProvider.getOnlyDailyTasks()[index],key: ValueKey(taskProvider.getOnlyDailyTasks()[index].taskId),);
              },
            );
          }
        },
      ),
    );
  }
  Future<void> _showFormDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddDailyTask();
      },
    );
  }
}
