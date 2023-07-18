// ignore_for_file: unused_field

import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  //reference the box
  final _myBox = Hive.box('mybox');

  //run this first time ever running this app
  void createInitialData() {
    toDoList = [
      ["Study", false]
    ];
  }

  //load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update database
  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
