import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) onEdit;

  const TaskList({
    required this.tasks,
    required this.onEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: Text(
          'No tasks to show',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, i) => TaskItem(
        task: tasks[i],
        onEdit: onEdit,
      ),
    );
  }
}
