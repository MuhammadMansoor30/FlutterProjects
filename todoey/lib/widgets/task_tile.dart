import 'package:flutter/material.dart';


class TaskTile extends StatelessWidget {
  String title;
  bool isChecked = false;
  void Function(bool?) onChanged;
  void Function() longPressCallback;

  TaskTile({required this.title, required this.isChecked, required this.onChanged, required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: onChanged,
      ),
    );
  }
}