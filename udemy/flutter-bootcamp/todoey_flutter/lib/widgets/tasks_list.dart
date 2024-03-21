// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

import 'task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];

          return TaskTile(
            isChecked: task.isDone,
            taskTitle: task.name,
            checkboxCallback: (checkboxState) {
              taskData.updateTask(task);
            },
            longPressCallback: () {
              taskData.removeTask(task);
            },
          );
        },
        itemCount: taskData.taskCount,
      ),
    );
  }
}
