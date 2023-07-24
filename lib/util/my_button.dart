import "package:flutter/material.dart";
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color.fromARGB(255, 1, 63, 107),
      child: Text(text,
          style: TextStyle(
            color: Color.fromARGB(255, 148, 187, 219),
            fontFamily: 'game',
          ),
        )
    );
  }
}