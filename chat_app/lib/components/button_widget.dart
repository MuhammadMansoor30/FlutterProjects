import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final Color color;
  final String text;

  ButtonWidget({required this.color, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black87
            ),
          ),
        ),
      ),
    );
  }
}