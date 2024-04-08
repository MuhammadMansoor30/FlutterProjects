import 'package:flutter/material.dart';
import 'package:todoey_prac/models/task_data.dart';
import 'package:todoey_prac/widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) => AddTaskScreen());
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(40.0, 30.0, 30.0, 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.list, size: 30.0, color: Colors.lightBlueAccent,),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  Text(
                    "Todoey",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    "${Provider.of<TaskData>(context).tasksCount} Tasks",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
                ),
                child: TaskList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

