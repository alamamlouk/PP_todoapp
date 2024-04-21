import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/feature/DisplayTaskDetails/Screren/task_details.dart';
import 'package:todo_app/app/feature/Home/HomePageWidgets/status_widget.dart';
import 'package:todo_app/core/Shared/services/CategoryService/global_task_services.dart';

import '../../../../core/Entity/Task.dart';
import '../../../../core/Providers/task_provider.dart';
import 'functions.dart';

class TaskListItem extends StatefulWidget {
  final Task task;

  const TaskListItem({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  late Task fetchedTask;
  GlobalTaskServices globalTaskServices = GlobalTaskServices();
  late TaskProvider taskProvider;
  @override
  void initState() {
    super.initState();

    taskProvider = Provider.of<TaskProvider>(context, listen: false);
    fetchedTask = taskProvider.getTaskById(widget.task.taskId!);

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: ListTile(
        onTap: () {
          try {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskDetails(task: fetchedTask)),
            );
          } catch (error) {
            print("the error:  ${error.toString()}");
          }
        },
        title: Text(
          widget.task.taskName,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.category!.categoryName,style: TextStyle(color: Colors.grey),

            ),
            if(widget.task.subTasks!=null && widget.task.subTasks!.isNotEmpty)
              Row(
                children: [
                  Icon(Icons.check_circle_outline,size: 20,),
                  Text(" ${widget.task.subTasks!.length} subTasks",style: TextStyle(color:Colors.black87),)
                ],
              )
              

          ],
        ),
        trailing: widget.task.subTasks!.isEmpty?
        StatusWidget(status: widget.task.status):CircularPercentIndicator(
          radius: 20.0,
          lineWidth: 3.0,
          animation: true,
          percent: widget.task.percentage.toDouble()/100,
          center: Text(
            '${widget.task.percentage} %',
            style:
            const TextStyle(fontWeight: FontWeight.bold, fontSize:10.0),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.purple,
        ),
      ),
    );
  }
}
