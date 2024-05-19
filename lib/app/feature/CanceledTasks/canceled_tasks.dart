import 'package:flutter/material.dart';

class CanceledTasks extends StatelessWidget {
  const CanceledTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: Text("Canceled tasks"),
      ),
    );
  }
}
