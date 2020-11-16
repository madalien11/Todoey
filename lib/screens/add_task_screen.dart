import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

String taskTitle;

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.red[200])),
          TextField(
            onChanged: (value) {
              taskTitle = value;
            },
            autofocus: true,
            textAlign: TextAlign.center,
            cursorColor: Colors.red[200],
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.red[200],
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.red[200],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          FlatButton(
            color: Colors.red[200],
            child: Text('Add',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            onPressed: () {
              if (taskTitle != null && taskTitle.trim().length > 0) {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskTitle);
              }
              Navigator.pop(context);
              taskTitle = '';
            },
          )
        ],
      ),
    );
  }
}
