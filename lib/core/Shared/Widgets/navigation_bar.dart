import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home,color: Colors.red)),
        BottomNavigationBarItem(
            label: 'Calendar', icon: Icon(Icons.calendar_month,color: Colors.red,)),
        BottomNavigationBarItem(
            label: 'Add', icon: Icon(Icons.add_circle_outlined,color: Colors.red)),
        BottomNavigationBarItem(label: 'Stat', icon: Icon(Icons.analytics,color: Colors.red)),
        BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings,color: Colors.red)),
      ],
    );
  }
}
