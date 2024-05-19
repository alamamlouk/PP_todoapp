import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/DTO/dailyTaskDto.dart';
import 'package:todo_app/core/Providers/task_provider.dart';
import 'package:todo_app/core/Shared/services/global_task_services.dart';

import '../../../../core/Entity/task.dart';

class AddDailyTask extends StatefulWidget {
  const AddDailyTask({Key? key}) : super(key: key);

  @override
  _AddDailyTaskState createState() => _AddDailyTaskState();
}

class _AddDailyTaskState extends State<AddDailyTask> {
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController textEditingController = TextEditingController();
    GlobalTaskServices globalTaskServices =GlobalTaskServices();



    return AlertDialog(
      title:
      const Text( "Add daily task"),
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
            hintText: 'Enter Daily task name',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Daily task name';
            }
            return null;
          },
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {

            if (formKey.currentState!.validate()) {
                Task task= Task(taskName: textEditingController.text, taskDescription: ""); 
                DailyTaskDTO dailyTaskDTO=DailyTaskDTO(todoUserId: "6605f689968ba82e5b840ec0", task: task);
                Task createdDailyTask = await globalTaskServices.addDailyTask(dailyTaskDTO);
                Provider.of<TaskProvider>(context, listen: false)
                    .add(createdDailyTask);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
  }

