import 'package:flutter/material.dart';
class BuildDateTime extends StatelessWidget {
  final data;
  final Color hintTextColor;
  final IconData fontAwesomeIcons;
  const BuildDateTime({Key? key, required this.data, required this.fontAwesomeIcons, required this.hintTextColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 10),
              color: Colors.grey.withOpacity(.6),
              spreadRadius: -5
          ),
        ],
        borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black, // Border color
            width: 1, // Border width
          )
      ),
      child: ListTile(

        title: Text(data,style: TextStyle(color: hintTextColor),),
        trailing:  Icon(
          fontAwesomeIcons,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
