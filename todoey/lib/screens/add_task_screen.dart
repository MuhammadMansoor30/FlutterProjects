import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_prac/models/task.dart';
import 'package:todoey_prac/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  late String taskName;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 35.0,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value){
                taskName = value;
              },
            ),
            SizedBox(height: 20.0,),
            FlatButton(
              color: Colors.lightBlueAccent,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0
                  ),
                ),
              ),
              onPressed: (){
                Provider.of<TaskData>(context, listen: false).addTask(Task(name: taskName));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
