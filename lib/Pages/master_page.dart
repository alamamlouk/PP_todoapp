import 'package:flutter/material.dart';
import 'package:todo_app/app/feature/DisplayTasksInCalendar/Presentation/planing.dart';
import 'package:todo_app/app/feature/Home/Screen/home_page.dart';
import 'package:todo_app/core/Shared/Widgets/navigation_bar.dart';
import '../app/feature/AddTask/Screen/add_task_screen.dart';
class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  int _currentIndex = 0;

  List<Widget> pages = const [HomePage(), Planing()];
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: pages,
        ),
        bottomNavigationBar: CustomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
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
