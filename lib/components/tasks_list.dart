import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) => ListView.builder(
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TaskTile(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkBoxCallBack: (checkboxState) =>
                      taskData.updateTask(task),
                  longPressCallBack: () async {
                    taskData.deleteTask(task);
                  });
            },
            itemCount: taskData.taskCount),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
