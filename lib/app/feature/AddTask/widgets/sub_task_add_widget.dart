import 'package:flutter/material.dart';

class SubTaskAddWidget extends StatelessWidget {
   TextEditingController subTaskTitle =new TextEditingController() ;
    TextEditingController subTaskDescription =new TextEditingController() ;
    final Function deleteSubTask ;
    SubTaskAddWidget({Key? key,required this.deleteSubTask}) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

          margin: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
          ),
          child: Column(
            children: <Widget>[
              TextField(
                controller: subTaskTitle,
              ),
              TextField(
                controller: subTaskDescription,
              )
            ],
          )
        ),
        Positioned(
          top: -10.0, // Adjust top padding as needed
          right: 5.0, // Adjust right padding as needed
          child:IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              deleteSubTask(this);
            },
          ),
        ),
      ],
    );
  }
}
