import 'package:flutter/material.dart';
import 'constants.dart';

class IconWidget extends StatelessWidget {
  final IconData? icon;
  final String? text;

  IconWidget({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
            text!,
            style: kLabelTextStyle
        ),
      ],
    );
  }
}