import 'package:flutter/material.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  BottomButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.0,
        padding: EdgeInsets.all(20.0),
        width: double.infinity,
        color: Color(0xFFEB1555),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: kBottomButtonStyle,
        ),
      ),
    );
  }
}