import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/feature/DisplayTasksInCalendar/Presentation/planing.dart';
import 'package:todo_app/core/Providers/task_category_provider.dart';
import 'package:todo_app/core/Providers/task_provider.dart';
import 'package:todo_app/core/Shared/Widgets/navigation_bar.dart';
import 'package:todo_app/app/feature/Home/Screen/home_page.dart';
import 'package:todo_app/core/Shared/services/CategoryService/global_category_service.dart';
import '../app/feature/AddTask/Screen/add_task_screen.dart';
import '../core/Entity/Task.dart';
import '../core/Entity/task_category.dart';
import '../core/Shared/services/CategoryService/global_task_services.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
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

  int _currentIndex = 0;

  List<Widget> pages = const [HomePage(), Planing()];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: _currentIndex == 0 ? Colors.red : null,
                          ),
                          Text("Home")
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: _currentIndex == 1 ? Colors.red : null,
                          ),
                          Text("Calendar")
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        // setState(() {
                        //   _currentIndex = 3;
                        // });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.analytics,
                            color: _currentIndex == 2 ? Colors.red : null,
                          ),
                          Text("Stat")
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        // setState(() {
                        //   _currentIndex = 4;
                        // });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            color: _currentIndex == 3 ? Colors.red : null,
                          ),
                          Text("Settings")
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        extendBody: true,
        floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddTaskScreen()),
              );
            },
            child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
