import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final String text;

  const CategoryItem({Key? key, required this.text}) : super(key: key);

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
          widget.text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
