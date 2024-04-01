import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/Entity/Task.dart';

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> appointments) {
    this.appointments = appointments;
  }
}

DataSource getCalendarDataSource(List<Task> tasks) {
  final List<Appointment> appointments = tasks.map((task) {
    return Appointment(
      startTime: task.taskStartTime ?? DateTime.now(),
      endTime: task.taskEndTime ?? DateTime.now(),
      subject: task.taskName,
      color: Colors.blue, // Customize color based on your requirements
    );
  }).toList();

  return DataSource(appointments);
}
