import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:todo_app/core/Entity/task.dart';
import 'package:todo_app/core/Providers/task_provider.dart';
import 'package:todo_app/core/Shared/services/global_task_services.dart';

import '../../DisplayTaskDetails/Screren/task_details.dart';
import '../Function/get_calendar_data_source.dart';

class Planing extends StatefulWidget {
  const Planing({Key? key}) : super(key: key);

  @override
  _PlaningState createState() => _PlaningState();
}

class _PlaningState extends State<Planing> {
  final GlobalTaskServices _globalTaskServices = GlobalTaskServices();
  bool isLoading = false;

  Future<void> fetchTasks(TaskProvider taskProvider) async {
    try {
      List<Task> fetchedTasks = await _globalTaskServices.fetchTasks();
      taskProvider.setTasks(fetchedTasks);
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("hello")),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) {
          return isLoading
              ? const Center(child: CircularProgressIndicator())
              : SfCalendar(
                view: CalendarView.day,
                timeSlotViewSettings:
                    const TimeSlotViewSettings(timeIntervalHeight: 100),
                dataSource: getCalendarDataSource(taskProvider.tasks),
                onTap: (calendarTapDetails) {
                  Task tappedTask = taskProvider.tasks.firstWhere((task) =>
                      task.taskName ==
                      calendarTapDetails.appointments![0].subject);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TaskDetails(task: tappedTask)),
                  );
                },
              );
        },
      ),
    );
  }
}
