import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Pages/master_page.dart';
import 'package:todo_app/Pages/splash_screen.dart';
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
    TaskProvider taskProvider =
        Provider.of<TaskProvider>(context, listen: false);
    TaskCategoryProvider taskCategoryProvider =
        Provider.of<TaskCategoryProvider>(context, listen: false);
    fetchTasks(taskProvider);
    fetchTaskCategory(taskCategoryProvider);
  }

  Future<void> fetchTasks(TaskProvider taskProvider) async {
    try {
      List<Task> fetchedTasks = await _globalTaskServices.fetchTasks();
      taskProvider.setTasks(fetchedTasks);
    } catch (error) {
      print('Error fetching tasks: $error');
    }
  }

  Future<void> fetchTaskCategory(
      TaskCategoryProvider taskCategoryProvider) async {
    try {
      List<TaskCategory> fetchedTaskCategories =
          await _globalCategoryService.fetchAllCategories();
      taskCategoryProvider.setTaskCategory(fetchedTaskCategories);
    } catch (error) {
      print('Error fetching categories: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MasterPage());
  }
}
