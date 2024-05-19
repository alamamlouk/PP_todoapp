  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'package:todo_app/Pages/master_page.dart';
  import 'package:todo_app/core/Providers/sub_task_provider.dart';
  import 'package:todo_app/core/Providers/task_category_provider.dart';
  import 'package:todo_app/core/Providers/task_provider.dart';
  import 'package:workmanager/workmanager.dart';
  import 'core/Entity/task.dart';
  import 'core/Entity/task_category.dart';
  import 'core/Shared/services/global_category_service.dart';
  import 'core/Shared/services/global_task_services.dart';

  void callbackDispatcher(TaskProvider  taskProvider) {
   Workmanager().executeTask((taskName, inputData){
     switch(taskName) {
       case 'firstTask':
         taskProvider.resetDailyTask();
         break;
       default:
     }

     return Future.value(true);
   });
  }
  void resetDailyTask() async {

      await Workmanager().registerPeriodicTask(
        "start-task",
        "firstTask", // Ensure name matches callback
        frequency: const Duration(hours:24),
        initialDelay: const Duration(hours: 24));
  }
  void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Workmanager().initialize(callbackDispatcher,
    isInDebugMode: true
    );
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
        resetDailyTask();
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
