import 'package:flutter/material.dart';
import 'package:todo_app/app/feature/Home/HomePageWidgets/app_bar.dart';
import 'package:todo_app/app/feature/Home/HomePageWidgets/task_status.dart';
import 'package:todo_app/core/Shared/services/global_category_service.dart';

import '../HomePageWidgets/recent_tasks.dart';

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

  final GlobalCategoryService globalCategoryService = GlobalCategoryService();

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppBarHomePage(),
        const TaskStatus(),
        Container(
            margin: const EdgeInsets.fromLTRB(15,10,0,15),
            child: const Text("Recent Tasks",style: TextStyle(fontSize: 20),)),
        const RecentTasks()],
    );
  }
}
