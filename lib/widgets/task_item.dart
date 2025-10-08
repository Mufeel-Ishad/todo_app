import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(Task) onEdit;

  const TaskItem({
    required this.task,
    required this.onEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.teal.shade300),
      ),
      color: task.completed ? Colors.teal.shade50 : Colors.white,
      child: Column(
        children: [
          ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.completed ? TextDecoration.lineThrough : null,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              task.description,
              style: TextStyle(
                decoration: task.completed ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.teal),
                  onPressed: () => onEdit(task),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () => taskProvider.deleteTask(task.id),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Text('Completed', style: TextStyle(fontSize: 12)),
                Switch(
                  value: task.completed,
                  onChanged: (_) => taskProvider.toggleComplete(task.id),
                  activeColor: Colors.teal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
