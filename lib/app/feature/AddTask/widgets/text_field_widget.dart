import 'package:flutter/material.dart';
import 'package:todo_app/core/Shared/Widgets/Custom_text_form_field.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;

  const TextFieldWidget(
      {Key? key, required this.textEditingController, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 15),
              color: Colors.grey.withOpacity(.6),
              spreadRadius: -5
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      child: Material(
        color: Colors.transparent,
        child: CustomTextFormField(

          borderDecoration: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),

          fillColor: Colors.white,
          controller: textEditingController,
          hintText: hintText,
          autofocus: false,
          suffix: const Icon(Icons.clear),
          prefix: const Icon(Icons.task),
      
        ),
      ),
    );
  }
}
