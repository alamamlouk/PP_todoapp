import 'package:flutter/material.dart';

import '../../../core/Entity/Task.dart';

class DailyTaskItemWidget extends StatefulWidget {
  final Task dailyTask;
  const DailyTaskItemWidget({Key? key, required this.dailyTask}) : super(key: key);

  @override
  State<DailyTaskItemWidget> createState() => _DailyTaskItemWidgetState();
}

class _DailyTaskItemWidgetState extends State<DailyTaskItemWidget> {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    if (widget.dailyTask.status == "DONE") {
      isChecked = true;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.dailyTask.taskName),
                ],
              ),
            ),
            IgnorePointer(
              ignoring: widget.dailyTask.status == "DONE",
              child: Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) async {
                  setState(() {
                    isChecked = value!;
                    widget.dailyTask.status = "DONE";
                  });

                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
