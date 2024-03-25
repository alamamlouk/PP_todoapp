import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/feature/AddTask/Services/Services.dart';
import 'package:todo_app/app/feature/AddTask/Shared/taskDto.dart';
import 'package:todo_app/app/feature/AddTask/widgets/paragraph_text_field.dart';
import 'package:todo_app/app/feature/AddTask/widgets/pick_date_widget.dart';
import 'package:todo_app/app/feature/AddTask/widgets/text_field_widget.dart';
import 'package:todo_app/core/Entity/Task.dart';
import 'package:todo_app/core/Entity/task_category.dart';
import 'package:todo_app/core/Shared/services/CategoryService/global_category_service.dart';

import '../../../../core/Providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
  final ValueNotifier<DateTime?> dateSub1 = ValueNotifier(null);
  AddTaskServices addTaskServices = AddTaskServices();
  GlobalCategoryService globalCategoryService = GlobalCategoryService();

  List<TaskCategory> categories = []; // List to store fetched categories
  TaskCategory? selectedCategory;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final fetchedCategories = await globalCategoryService.fetchAllCategories();
      setState(() {
        categories = fetchedCategories;
      });
    } catch (error) {
      print('Error fetching categories: $error');
      // Handle error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.xmarkSquare,
              size: 40,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(
                textEditingController: taskTitleController,
                hintText: "hintText",
              ),
              PickDateWidget(dateSub: dateSub),
              PickDateWidget(dateSub: dateSub1),
              ParagraphTextField(
                textEditingController: descriptionController,
                hintText: "description",
              ),
              // Display categories in a Wrap layout
              Wrap(
                spacing: 8.0,
                children: categories.map((TaskCategory category) {
                  bool isSelected = category == selectedCategory;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = isSelected ? null : category;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green : Colors.white,
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(category.categoryName),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate() && selectedCategory != null) {
                      String taskName = taskTitleController.text;
                      String taskDescription = descriptionController.text;
                      DateTime? taskStartTime = dateSub.value;
                      DateTime? taskEndTime = dateSub1.value;
                      String userId = "65c0cf8db118436221ba47df";
                      String categoryId = selectedCategory!.categoryId;
                      Task task = Task(
                        taskName: taskName,
                        taskDescription: taskDescription,
                        taskStartTime: taskStartTime,
                        taskEndTime: taskEndTime,
                      );
                      TaskDto taskDTO = TaskDto(todoUserId: userId, task: task, categoryId: categoryId);
                      Task newTask=await addTaskServices.addTask(taskDTO);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('task added')),
                      );
                      Provider.of<TaskProvider>(context, listen: false).add(newTask);


                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Check data')),
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
