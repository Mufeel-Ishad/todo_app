import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitTask() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty) return;

    Provider.of<TaskProvider>(
      context,
      listen: false,
    ).addTask(title, description);

    Navigator.of(context).pop(); // Close dialog

    ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
        content: Text("Task added successfully!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        backgroundColor: Colors.tealAccent.shade700,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Task', style: TextStyle(color: Colors.teal)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            cursorColor: Colors.teal, // Set the cursor color
            decoration: InputDecoration(
              labelText: 'Title',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              ),
              labelStyle: TextStyle(color: Colors.teal),
            ),
          ),
          SizedBox(height: 12),
          TextField(
            controller: _descriptionController,
            cursorColor: Colors.teal, // Set the cursor color
            decoration: InputDecoration(
              labelText: 'Description',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              ),
              labelStyle: TextStyle(color: Colors.teal),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Cancel', style: TextStyle(color: Colors.teal)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
          ),
          onPressed: _submitTask,
          child: Text('Add'),
        ),
      ],
    );
  }
}
