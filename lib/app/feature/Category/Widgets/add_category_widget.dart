import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/Entity/task_category.dart';
import 'package:todo_app/core/Providers/task_category_provider.dart';

import '../../../../core/Shared/services/CategoryService/global_category_service.dart';

class AddCategoryWidget extends StatelessWidget {
  final TaskCategory? categoryToUpdate;
  const AddCategoryWidget({Key? key, this.categoryToUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController categoryNameController = TextEditingController();
    GlobalCategoryService globalCategoryService = GlobalCategoryService();

    if (categoryToUpdate != null) {
      categoryNameController.text = categoryToUpdate!.categoryName;
    }

    return AlertDialog(
      title:
          Text(categoryToUpdate != null ? "Update category" : "Add a category"),
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: categoryNameController,
          decoration: InputDecoration(
            hintText: 'Enter category name',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter category name';
            }
            return null;
          },
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              if (categoryToUpdate != null) {
                categoryToUpdate!.categoryName = categoryNameController.text;
                await globalCategoryService.updateCategory(categoryToUpdate!);
                Provider.of<TaskCategoryProvider>(context, listen: false)
                    .updateCategory(categoryToUpdate!);
              } else {
                TaskCategory cat = await globalCategoryService
                    .addCategory(categoryNameController.value.text);
                Provider.of<TaskCategoryProvider>(context, listen: false)
                    .add(cat);
              }

              Navigator.of(context).pop();
            }
          },
          child: Text(categoryToUpdate != null ? 'Update' : 'Submit'),
        ),
      ],
    );
  }
}
