import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/Providers/task_provider.dart';
import 'Widgets/daily_task_item_widget.dart';

class DailyTaskPage extends StatelessWidget {
  const DailyTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {

      },child: Icon(Icons.add),),
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
