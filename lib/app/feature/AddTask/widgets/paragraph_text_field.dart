import 'package:flutter/material.dart';

import '../../../../core/Shared/Widgets/custom_text_form_field.dart';

class ParagraphTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;

  const ParagraphTextField(
      {Key? key, required this.textEditingController, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Colors.transparent,
        elevation: 20,
        child: CustomTextFormField(
          fillColor: Colors.white,
          borderDecoration: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          controller: textEditingController,
          hintText: hintText,
          autofocus: false,
          maxLines: 8,
        ),
      ),
    );
  }
}
