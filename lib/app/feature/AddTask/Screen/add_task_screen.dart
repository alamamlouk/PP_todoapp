import 'package:flutter/material.dart';
import 'package:todo_app/app/feature/AddTask/widgets/build_date_time.dart';
import 'package:todo_app/app/feature/AddTask/widgets/text_field_widget.dart';
import 'package:intl/intl.dart';

import '../Shared/functions.dart';
import '../widgets/pick_date_widget.dart';



class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController time1Controller = TextEditingController();
  TextEditingController time2Controller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
  final ValueNotifier<DateTime?> dateSub1=ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(
                textEditingController: taskTitleController,
                hintText: "Task Title",

              ),

              PickDateWidget(dateSub: dateSub),
              PickDateWidget(dateSub: dateSub1),




              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
