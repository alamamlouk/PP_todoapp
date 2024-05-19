import 'package:flutter/material.dart';
import 'package:todo_app/app/feature/DisplayTaskDetails/Widgets/time_deatils_row_day_month_date.dart';
import 'package:todo_app/app/feature/DisplayTaskDetails/Widgets/time_details_row_time.dart';

class TimeBoxDetail extends StatelessWidget {
  final DateTime taskStartTime;
  final DateTime taskEndTime;

  const TimeBoxDetail(
      {Key? key, required this.taskStartTime, required this.taskEndTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    TimeDetailsRowDayMonthDate(
                      taskTime: taskStartTime,
                    ),
                    TimeDetailsRowTime(
                      taskTime: taskStartTime,
                    )
                  ],
                ),
                const Center(
                  child: Icon(Icons.arrow_forward_outlined),
                ),
                Column(
                  children: [
                    TimeDetailsRowDayMonthDate(
                      taskTime: taskEndTime,
                    ),
                    TimeDetailsRowTime(
                      taskTime: taskEndTime,
                    )
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
