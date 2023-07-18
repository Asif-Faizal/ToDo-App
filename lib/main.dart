// ignore_for_file: unused_local_variable, await_only_futures

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_doo/pages/home_page.dart';

void main() async {
  //initialising hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        title: 'To Do',
      ),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
