import 'package:flutter/material.dart';
import 'package:todo_app/core/Shared/Widgets/navigation_bar.dart';
import 'package:todo_app/app/feature/Home/Screen/home_page.dart';

import '../app/feature/AddTask/Screen/add_task_screen.dart';
import '../app/feature/DisplayTasksInCalendar/Screen/calendar_screen.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  int _currentIndex = 0;

  List<Widget> pages = const [HomePage(), CalendarScreen(), AddTaskScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          if (newIndex != _currentIndex) {
            if (newIndex == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTaskScreen()),
              );
            } else {
              setState(() {
                _currentIndex = newIndex;
              });
            }
          }
        },      ),
    );
  }
}
