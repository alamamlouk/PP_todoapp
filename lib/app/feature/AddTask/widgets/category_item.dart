import 'package:flutter/material.dart';
import 'package:todo_app/core/Entity/task_category.dart';

class CategoryItem extends StatefulWidget {
  final TaskCategory category;
  final Function(TaskCategory) callBack;

  const CategoryItem({Key? key, required this.category, required this.callBack}) : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  Color _boxColor = Colors.blue;
  void _changeColor() {
    setState(() {
      clicked = !clicked;
      _boxColor = clicked ? Colors.green : Colors.blue;
    });
  }

  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _changeColor();
        widget.callBack(widget.category);
      },
      child: Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _boxColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          widget.category.categoryName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
