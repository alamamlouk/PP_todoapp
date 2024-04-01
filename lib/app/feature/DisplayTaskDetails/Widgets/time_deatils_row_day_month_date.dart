import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeDetailsRowDayMonthDate extends StatelessWidget {
  final DateTime taskTime;

  const TimeDetailsRowDayMonthDate({Key? key, required this.taskTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.access_time_outlined),
        const SizedBox(
          width: 8,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
              style: const TextStyle(fontSize: 15),
              "${DateFormat.E().format(taskTime).substring(0, 3)}, ${DateFormat.MMM().format(taskTime)} ${taskTime.day}"),
        )
      ],
    );
  }
}
