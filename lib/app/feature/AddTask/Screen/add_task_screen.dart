import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/feature/AddTask/Services/Services.dart';
import 'package:todo_app/app/feature/AddTask/Shared/taskDto.dart';
import 'package:todo_app/app/feature/AddTask/widgets/paragraph_text_field.dart';
import 'package:todo_app/app/feature/AddTask/widgets/pick_date_widget.dart';
import 'package:todo_app/app/feature/AddTask/widgets/text_field_widget.dart';
import 'package:todo_app/core/Entity/Task.dart';
import 'package:todo_app/core/Entity/sub_task.dart';
import 'package:todo_app/core/Entity/task_category.dart';
import 'package:todo_app/core/Providers/task_category_provider.dart';
import 'package:todo_app/core/Shared/services/CategoryService/global_category_service.dart';
import 'package:todo_app/core/Shared/services/CategoryService/global_task_services.dart';

import '../../../../core/Providers/task_provider.dart';
import '../widgets/sub_task_add_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController subTaskTitle = TextEditingController();
  TextEditingController subTaskDescription = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
  final ValueNotifier<DateTime?> dateSub1 = ValueNotifier(null);
  AddTaskServices addTaskServices = AddTaskServices();
  GlobalCategoryService globalCategoryService = GlobalCategoryService();
  GlobalTaskServices globalTaskServices = GlobalTaskServices();
  List<TaskCategory> categories = []; // List to store fetched categories
  TaskCategory? selectedCategory;
  List<SubTaskAddWidget> subtasksWidget = [];
  List<SubTask> subTasks = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void removeWidget(SubTaskAddWidget widget) {
    setState(() {
      int indexToRemove = subtasksWidget.indexOf(widget);
      if (indexToRemove != -1) {
        subtasksWidget.removeAt(indexToRemove);
      }
    });
  }

  Future<void> fetchCategories() async {
    try {
      final fetchedCategories =
      Provider.of<TaskCategoryProvider>(context, listen: false)
          .taskCategories;
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
        title: const Text("Add a new Task"),
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
                hintText: "Task Name",
              ),
              PickDateWidget(
                dateSub: dateSub,
                icon: FontAwesomeIcons.hourglassStart,
                hintText: "When the task will Start on",
              ),
              PickDateWidget(
                dateSub: dateSub1,
                icon: FontAwesomeIcons.hourglassEnd,
                hintText: "When the task will finish",
              ),
              ParagraphTextField(
                textEditingController: descriptionController,
                hintText: "description",
              ),
              Column(
                children: subtasksWidget.map((widget) {
                  return widget;
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            subtasksWidget.add(SubTaskAddWidget(
                              deleteSubTask: removeWidget,
                            ));
                          });
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.add),
                            Text("Add Sub Task"),
                          ],
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    if(subtasksWidget.isNotEmpty)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {subtasksWidget.clear();});
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.delete_forever),
                            Text("Delete all sub tasks"),
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.attach_file),
                            Text("Add attachment "),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Categories"),
                    Wrap(
                      runSpacing: 10,
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
                              color: isSelected ? Colors.green : Colors.grey.shade200
                              ,
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(  blurRadius: 8,
                                    offset: Offset(0, 15),
                                    color: Colors.grey.withOpacity(.6),
                                    spreadRadius: -5)
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(category.categoryName),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate() &&
                        selectedCategory != null) {
                      String taskName = taskTitleController.text;
                      String taskDescription = descriptionController.text;
                      DateTime? taskStartTime = dateSub.value;
                      DateTime? taskEndTime = dateSub1.value;
                      String userId = "6605f689968ba82e5b840ec0";
                      String categoryId = selectedCategory!.categoryId;
                      Task task = Task(
                        taskName: taskName,
                        taskDescription: taskDescription,
                        whenTheTaskWillStart: taskStartTime,
                        whenTheTaskWillBeDone: taskEndTime,
                      );
                      TaskDto taskDTO = TaskDto(
                          todoUserId: userId,
                          task: task,
                          categoryId: categoryId);
                      if (subtasksWidget.isNotEmpty) {
                        for (SubTaskAddWidget subtask in subtasksWidget) {
                          String subTaskTitle = subtask.subTaskTitle.text;
                          String subTaskDescription =
                              subtask.subTaskDescription.text;
                          SubTask newSubtask = SubTask(
                              subTaskName: subTaskTitle,
                              subTaskDescription: subTaskDescription);
                          subTasks.add(newSubtask);
                        }
                        taskDTO.subTasks = subTasks;
                      }
                      Task newTask = await addTaskServices.addTask(taskDTO);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('task added')),
                      );
                      Provider.of<TaskProvider>(context, listen: false)
                          .add(newTask);
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
