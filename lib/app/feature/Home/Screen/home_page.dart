import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/core/Shared/services/CategoryService/global_category_service.dart';

import '../../../../core/Providers/task_provider.dart';
import '../../Category/Presentation/display_category.dart';
import '../HomePageWidgets/BoxWithIconAndText .dart';
import '../HomePageWidgets/TaskListItem.dart';
import '../Services/task_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future<void> _refreshData(TaskProvider taskProvider) async {
  //
  //   setState(() {
  //     taskProvider.;
  //   });
  //   List<FetchRecentTaskDTO> updatedTasks = await _taskService.fetchTasks();
  //   setState(() {
  //     tasks = updatedTasks;
  //   });
  // }
  final TaskService _taskService = TaskService();

  final GlobalCategoryService globalCategoryService = GlobalCategoryService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                radius: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Hello Ala"),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayCategory()),
                      );
                    },
                    child: const Icon(
                      Icons.menu,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
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
          child: Consumer<TaskProvider>(
            builder: (context, taskProvider, child) {
              if (taskProvider.tasks.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
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
        )
      ],
    );
  }
}
