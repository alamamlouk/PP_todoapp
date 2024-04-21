import 'package:flutter/material.dart';

class BoxWithIconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backgroundColor;
  final Widget pageToNavigateTo;

  const BoxWithIconAndText(
      {super.key,
      required this.icon,
      required this.text,
      required this.backgroundColor, required this.pageToNavigateTo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
onTap: (){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => pageToNavigateTo),
  );
},
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 50.0, color: Colors.white),
            const SizedBox(height: 8.0),
            Text(text,
                style: const TextStyle(fontSize: 16.0, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
