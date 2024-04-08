import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  final Widget? cardChild;
  final Color? color;
  final void Function()? onPress;

  ReusableWidget({this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: cardChild,
      ),
    );
  }
}