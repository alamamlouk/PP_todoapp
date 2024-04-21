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
    String statusSplited = widget.status.replaceAll('_', ' ');
    String status=statusSplited.substring(0,1).toUpperCase()+statusSplited.substring(1).toLowerCase();
    return Container(
      width: 100,
      height: 40,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      decoration: BoxDecoration(
          color: getStatusColor(status),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(child: Text(status)),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'Done':
        return Colors.green;
      case 'Canceled':
        return Colors.red;
      case 'In progress':
        return Colors.orange;
      case 'Undone':
        return Colors.yellow;
      case 'Todo':
        return Colors.grey;
      case 'Late':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
