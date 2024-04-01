import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/feature/DisplayTaskDetails/Widgets/task_edit_option.dart';
import 'package:todo_app/core/Providers/task_provider.dart';
import 'package:todo_app/core/Shared/services/CategoryService/global_task_services.dart';
import '../../../../core/Entity/Task.dart';
import '../Widgets/status_widget.dart';
import '../Widgets/time_box_detail.dart';

class TaskDetails extends StatefulWidget {
  final Task task;

  const TaskDetails({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  late final TextEditingController taskNameController;
  final GlobalTaskServices globalTaskServices = GlobalTaskServices();

  @override
  void initState() {
    super.initState();
    taskNameController = TextEditingController(text: widget.task.taskName);
  }

  void deleteTask(String taskId) {
    globalTaskServices.deleteTask(taskId);
    Provider.of<TaskProvider>(context, listen: false).removeTask(taskId);
  }

  void editTask() async {
    Task updatedTask = Task(
      taskId: widget.task.taskId,
      taskName: taskNameController.text,
      taskDescription: widget.task.taskDescription,
      taskStartTime: widget.task.taskStartTime,
      taskEndTime: widget.task.taskEndTime,
      category: widget.task.category,
      status: widget.task.status,
    );
    Provider.of<TaskProvider>(context, listen: false).updateTask(updatedTask);
  }

  @override
  Widget build(BuildContext context) {
    taskNameController.text = widget.task.taskName;
    return Scaffold(
      appBar: AppBar(
        title: const Text("details"),
        actions: <Widget>[
          StatusWidget(
              status: widget.task.status.toLowerCase().replaceAll('_', ' ')),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(hintText: "Task name"),
                  controller: taskNameController,
                ),
                Text(
                  widget.task.category!.categoryName,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(widget.task.taskDescription)),
                TimeBoxDetail(
                  taskStartTime: widget.task.taskStartTime!,
                  taskEndTime: widget.task.taskEndTime!,
                ),

              ],
            ),
            TaskEditOption(
              deleteTask: deleteTask,
              editTask: editTask,
              taskId: widget.task.taskId!,
            )
          ],
        ),
      ),
    );
  }
}
