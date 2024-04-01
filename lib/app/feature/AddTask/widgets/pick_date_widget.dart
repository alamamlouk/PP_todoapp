import 'package:flutter/material.dart';

import '../Shared/functions.dart';
import 'build_date_time.dart';

class PickDateWidget extends StatelessWidget {
  ValueNotifier<DateTime?> dateSub = ValueNotifier(null);

  PickDateWidget({Key? key, required this.dateSub}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder<DateTime?>(
        valueListenable: dateSub,
        builder: (context, dateVal, child) {
          return InkWell(
            onTap: () async {
              DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2050),
                currentDate: DateTime.now(),
                initialEntryMode: DatePickerEntryMode.calendar,
                initialDatePickerMode: DatePickerMode.day,
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.fromSwatch(
                        primarySwatch: Colors.blueGrey,
                        backgroundColor: Colors.lightBlue,
                        cardColor: Colors.white,
                      ),
                    ),
                    child: child!,
                  );
                },
              );

              if (date != null) {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (time != null) {
                  date = DateTime(
                    date.year,
                    date.month,
                    date.day,
                    time.hour,
                    time.minute,
                  );
                  dateSub.value = date;
                }
              }
            },
            child: BuildDateTime(
              data: dateVal != null ? convertDate(dateVal) : '',
            ),
          );
        },
      ),
    );
  }
}
