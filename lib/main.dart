import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Pages/master_page.dart';
import 'package:todo_app/core/Providers/sub_task_provider.dart';
import 'package:todo_app/core/Providers/task_category_provider.dart';
import 'package:todo_app/core/Providers/task_provider.dart';

import 'core/Entity/Task.dart';
import 'core/Entity/task_category.dart';
import 'core/Shared/services/CategoryService/global_category_service.dart';
import 'core/Shared/services/CategoryService/global_task_services.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => TaskProvider()),
    ChangeNotifierProvider(create: (_) => TaskCategoryProvider()),
    ChangeNotifierProvider(create: (_)=>SubTaskProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>const MyHomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Keep me-up',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalTaskServices _globalTaskServices = GlobalTaskServices();
  final GlobalCategoryService _globalCategoryService = GlobalCategoryService();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      TaskProvider taskProvider =
      Provider.of<TaskProvider>(context, listen: false);
      TaskCategoryProvider taskCategoryProvider =
      Provider.of<TaskCategoryProvider>(context, listen: false);
      taskProvider.setIsLoading(true);
      fetchTasks(taskProvider);
      fetchTaskCategory(taskCategoryProvider);
    });
  }

  Future<void> fetchTasks(TaskProvider taskProvider) async {
    try {
      List<Task> fetchedTasks = await _globalTaskServices.fetchTasks();
      taskProvider.setTasks(fetchedTasks);
    } catch (error) {
      print('Error fetching tasks: $error');
    }
    finally{
      taskProvider.setIsLoading(false);
    }
  }

  Future<void> fetchTaskCategory(
      TaskCategoryProvider taskCategoryProvider) async {
    try {
      dynamic fetchedTaskCategories =
          await _globalCategoryService.fetchAllCategories();
      if(fetchedTaskCategories == " No category found "){
        return;
      }else{
        taskCategoryProvider.setTaskCategory(fetchedTaskCategories as List<TaskCategory>);
      }

    } catch (error) {
      rethrow;
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MasterPage());
  }
}
