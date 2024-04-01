import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () => onTap(0),
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentIndex == 0 ? Colors.red : null,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          color: currentIndex == 0 ? Colors.red : null,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () => onTap(1),
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: currentIndex == 1 ? Colors.red : null,
                      ),
                      Text(
                        "Calendar",
                        style: TextStyle(
                          color: currentIndex == 1 ? Colors.red : null,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    // setState(() {
                    //   _currentIndex = 3;
                    // });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.analytics,
                        color: currentIndex == 2 ? Colors.red : null,
                      ),
                      Text(
                        "Stat",
                        style: TextStyle(
                          color: currentIndex == 2 ? Colors.red : null,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    // setState(() {
                    //   _currentIndex = 4;
                    // });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        color: currentIndex == 3 ? Colors.red : null,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(
                          color: currentIndex == 3 ? Colors.red : null,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
