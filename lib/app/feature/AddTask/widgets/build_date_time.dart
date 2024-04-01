import 'package:flutter/material.dart';

class BuildDateTime extends StatelessWidget {
  final String data;

  const BuildDateTime({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 8,
      child: Container(
        color: Colors.white,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.blueGrey, width: 1.5),
          ),
          title: Text(data),
          trailing: const Icon(
            Icons.calendar_today,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
