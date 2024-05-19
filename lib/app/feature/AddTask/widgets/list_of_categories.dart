import 'package:flutter/material.dart';

import '../../../../core/Entity/task_category.dart';
import 'category_item.dart';

class ListOfCategories extends StatefulWidget {
  final List<TaskCategory> categories;
  final Function(TaskCategory) callBack;

  const ListOfCategories({Key? key, required this.categories, required this.callBack}) : super(key: key);

  @override
  _ListOfCategoriesState createState() => _ListOfCategoriesState();
}

class _ListOfCategoriesState extends State<ListOfCategories> {
  TaskCategory? selectedCategory;

  void _updateSelectedCategory(bool isSelected, TaskCategory category) {
    setState(() {
    selectedCategory = isSelected ? null : category;
    if(selectedCategory!= null){
      widget.callBack(selectedCategory!);
    }
    });
  }
  TaskCategory? getSelectedCategory() {
    return selectedCategory;
  }


  @override
  Widget build(BuildContext context) {
    return    Container(
      margin: const EdgeInsets.all(10),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Categories"),
          Wrap(
            runSpacing: 10,
            spacing: 8.0,
            children: widget.categories.map((TaskCategory category) {
              bool isSelected = category ==selectedCategory;
              return CategoryItem(
                  category: category,
                  callBack: (category, isSelected) {
                    _updateSelectedCategory(isSelected, category);
                  },
                  isSelected: isSelected);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
