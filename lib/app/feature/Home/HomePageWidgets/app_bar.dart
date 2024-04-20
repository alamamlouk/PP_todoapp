import 'package:flutter/material.dart';

import '../../Category/Presentation/display_category.dart';

class AppBarHomePage extends StatefulWidget {
  const AppBarHomePage({Key? key}) : super(key: key);

  @override
  _AppBarHomePageState createState() => _AppBarHomePageState();
}

class _AppBarHomePageState extends State<AppBarHomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.orangeAccent,
            radius: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Hello Ala"),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DisplayCategory()),
                  );
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
