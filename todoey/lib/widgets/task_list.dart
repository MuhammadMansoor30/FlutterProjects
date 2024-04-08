import 'package:flutter/material.dart';
import 'package:todoey_prac/models/task_data.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // We can use both consumer widget as well as basic method of Provider.of
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          itemCount: taskData.tasksCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              title: task.name,
              isChecked: task.isDone,
              onChanged: (value){
                taskData.updateTask(task);
              },
              longPressCallback: (){
                taskData.deleteTask(task);
              },
            );
          },
        );
      },
    );
  }
}