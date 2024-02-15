import 'package:flutter/material.dart';
import 'package:todo_app/core/Shared/Widgets/Custom_text_form_field.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  const TextFieldWidget({Key? key,required this.textEditingController,required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: CustomTextFormField(
          controller:textEditingController ,
          hintText: hintText,
          autofocus: false,

        ),
    );

  }

}
