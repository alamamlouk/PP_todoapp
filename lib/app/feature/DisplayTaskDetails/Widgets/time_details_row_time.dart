import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeDetailsRowTime extends StatelessWidget {
  final DateTime taskTime;

  const TimeDetailsRowTime({Key? key, required this.taskTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {}, child: Text("${DateFormat.jm().format(taskTime)}"));
  }
}
