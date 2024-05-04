
import 'package:flutter/material.dart';

import '../../../../core/Shared/Widgets/Custom_text_form_field.dart';

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

            border: Border.all(color: Colors.red,width: 3),
            borderRadius: BorderRadius.circular(20),

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin:EdgeInsets.all(10),
                child: CustomTextFormField(
                  controller: subTaskTitle,
                  width: 350,
                  autofocus: false,
                  contentPadding: EdgeInsets.all(10),
                  fillColor: Colors.white,
                    hintText: "Sub task name",
                  borderDecoration: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              Container(
                margin:EdgeInsets.all(10),
                child: CustomTextFormField(
                  controller: subTaskDescription,
                  width: 350,
                  autofocus: false,

                  contentPadding: EdgeInsets.all(10),
                  fillColor: Colors.white,
                  hintText: "Sub task description",
                  maxLines: 2,
                  borderDecoration: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),

            ],
          )
        ),
        Positioned(
          top: 0.0, // Adjust top padding as needed
          right: 5.0, // Adjust right padding as needed
          child:Container(
            decoration: BoxDecoration(
              color: Colors.red.shade300,
              shape: BoxShape.circle,

            ),
            width: 40,
            height: 40,
            child: IconButton(

              icon: Icon(Icons.delete),
              iconSize: 25,
              onPressed: () {
                deleteSubTask(this);
              },
            ),
          ),
        ),
      ],
    );
  }
}
