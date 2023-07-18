// ignore_for_file: unused_field, prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_doo/data/database.dart';
import 'package:to_doo/util/todo_tile.dart';
import 'package:to_doo/util/diolog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //if first time opening the app
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //data exists already
      db.loadData();
    }
  }

//text controller
  final _controller = TextEditingController();

//checkbox function
  void checkBoXChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

//save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

//create new task
  void createNewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancell: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "TO DO",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        elevation: 5,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewtask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              onChanged: (value) => checkBoXChanged(value, index),
              taskCompleted: db.toDoList[index][1],
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
