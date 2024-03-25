
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Pages/master_page.dart';
import 'package:todo_app/core/Providers/task_category_provider.dart';
import 'package:todo_app/core/Providers/task_provider.dart';




void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>TaskProvider()),
    ChangeNotifierProvider(create: (_)=>TaskCategoryProvider()),

  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      title: 'Keep me-up',

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: MasterPage()

    );
  }
}
