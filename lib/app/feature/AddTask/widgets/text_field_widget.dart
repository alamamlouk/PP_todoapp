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
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Material(
        color: Colors.transparent,
        elevation: 20,
        child: CustomTextFormField(
          controller: textEditingController,
          hintText: hintText,
          autofocus: false,
        ),
      ),
    );
  }
}
