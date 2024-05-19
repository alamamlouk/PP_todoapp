import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/Entity/task.dart';

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> appointments) {
    this.appointments = appointments;
  }
}

DataSource getCalendarDataSource(List<Task> tasks) {
  final List<Appointment> appointments = tasks.map((task) {
    return Appointment(
      startTime: task.whenTheTaskWillStart ?? DateTime.now(),
      endTime: task.whenTheTaskWillBeDone ?? DateTime.now(),
      subject: task.taskName,
      color: Colors.blue,
    );
  }).toList();

  return DataSource(appointments);
}
