import 'package:flutter/material.dart';

class StatusWidget extends StatefulWidget {
  final String status;
  const StatusWidget({Key? key, required this.status}) : super(key: key);

  @override
  _StatusWidgetState createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      decoration: BoxDecoration(
          color: getStatusColor(),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(child: Text(widget.status)),
    );
  }

  Color getStatusColor() {
    String status = widget.status.toLowerCase();
    switch (status) {
      case 'done':
        return Colors.green;
      case 'canceled':
        return Colors.red;
      case 'in progress':
        return Colors.orange;
      case 'undone':
        return Colors.yellow;
      case 'todo':
        return Colors.grey;
      case 'late':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
