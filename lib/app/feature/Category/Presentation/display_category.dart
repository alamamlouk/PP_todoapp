import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/feature/Category/Widgets/add_category_widget.dart';
import 'package:todo_app/app/feature/Category/Widgets/display_category_item.dart';
import 'package:todo_app/core/Providers/task_category_provider.dart';
import 'package:todo_app/core/Shared/services/CategoryService/global_category_service.dart';

import '../../../../core/Entity/task_category.dart';

class DisplayCategory extends StatefulWidget {
  const DisplayCategory({Key? key}) : super(key: key);

  @override
  _DisplayCategoryState createState() => _DisplayCategoryState();
}

class _DisplayCategoryState extends State<DisplayCategory> {
  GlobalCategoryService _globalCategoryService = GlobalCategoryService();
  void deleteCategory(TaskCategory taskCategory)async{
    String response =await _globalCategoryService.deleteCategory(taskCategory);
    print(response);
    if(response=="Category deleted"){
      Provider.of<TaskCategoryProvider>(context, listen: false).deleteCategory(taskCategory);
    }
  }
  void updateCategory(TaskCategory taskCategory) async{
    // await _globalCategoryService.updateCategory(taskCategory);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: _buildCategoryList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _showFormDialog(context);
          // _refreshCategories();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildCategoryList() {
    return Center(
      child: Consumer<TaskCategoryProvider>(
        builder: (context,taskCategoryProvider,child) {
          if (taskCategoryProvider.taskCategories.isEmpty) {
            return const CircularProgressIndicator();
          }  else {
            return ListView.builder(
              itemCount: taskCategoryProvider.taskCategories.length,
              itemBuilder: (BuildContext context, int index) {
                return DisplayCategoryItem(taskCategory: taskCategoryProvider.taskCategories[index], deleteCategory: deleteCategory, );
              },
            );
          }
        },
      ),
    );
  }

  Future<void> _showFormDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddCategoryWidget();
      },
    );
  }

  // void _refreshCategories() {
  //   setState(() {
  //     _globalCategoryService.fetchAllCategories().then((updatedCategories) {
  //       categories = updatedCategories;
  //     });
  //   });
  // }
}
