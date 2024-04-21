import 'package:flutter/material.dart';
import 'package:todo_app/core/Entity/task_category.dart';

class CategoryItem extends StatefulWidget {
  final TaskCategory category;
  final Function(TaskCategory, bool) callBack;
  final bool isSelected;

  const CategoryItem(
      {Key? key,
      required this.category,
      required this.callBack,
      required this.isSelected})
      : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.callBack(widget.category, widget.isSelected);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.green : Colors.grey.shade200,
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                offset: Offset(0, 15),
                color: Colors.grey.withOpacity(.6),
                spreadRadius: -5)
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(widget.category.categoryName),
      ),
    );
  }
}
