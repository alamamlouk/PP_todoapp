import 'package:flutter/material.dart';

import '../../../../core/Entity/task_category.dart';
import 'add_category_widget.dart';

class DisplayCategoryItem extends StatelessWidget {
  final TaskCategory taskCategory;
  final Function deleteCategory;

  const DisplayCategoryItem({
    Key? key,
    required this.taskCategory,
    required this.deleteCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(taskCategory.categoryName),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AddCategoryWidget(
                          categoryToUpdate: taskCategory,
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    deleteCategory(taskCategory);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
