import "package:flutter/material.dart";
import 'package:todo/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
    {super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 119, 180, 230),
      content: Container(
          height: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //get user input
              TextField(
                controller: controller,
                style: TextStyle(
                  fontFamily: 'game',
                  fontSize: 14.0,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new task",
                ),
              ),
              //buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //save button
                  MyButton(text: "Save", onPressed: onSave),
                  //cancel button
                  MyButton(text: "Cancel", onPressed: onCancel)
                ],
              )
            ],
          )),
    );
  }
}
