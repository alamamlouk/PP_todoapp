import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return   BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.blue,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.home),
              onPressed: () =>onTap(currentIndex),
            ),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.calendar_month),
              onPressed: () =>onTap(currentIndex),
            ),
            Spacer(),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.analytics),
              onPressed: () =>onTap(currentIndex),
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.settings),
              onPressed: () =>onTap(currentIndex),
            ),
          ],
        ),
      ),
    );
  }
}
