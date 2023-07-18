import 'package:flutter/material.dart';
import 'package:to_doo/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancell;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancell});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Add New task"),
          ),
          //Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //save button
            children: [
              MyButton(text: "Save", onPressed: onSave),
              //cancell button
              MyButton(text: "Cancel", onPressed: onCancell),
            ],
          )
        ]),
      ),
    );
  }
}
