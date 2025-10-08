import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class EditTaskDialog extends StatefulWidget {
  final Task task;

  const EditTaskDialog({required this.task, super.key});

  @override
  State<EditTaskDialog> createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController = TextEditingController(text: widget.task.description);
  }

  void _saveChanges() {
    final newTitle = _titleController.text.trim();
    final newDesc = _descriptionController.text.trim();

    if (newTitle.isEmpty || newDesc.isEmpty) return;

    Provider.of<TaskProvider>(context, listen: false)
        .editTask(widget.task.id, newTitle, newDesc);

    Navigator.of(context).pop(); // Close dialog

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Changes saved successfully!"),
        backgroundColor: Colors.teal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Task', style: TextStyle(color: Colors.teal)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Title',
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
            ),
          ),
          SizedBox(height: 12),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: 'Description',
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel', style: TextStyle(color: Colors.teal)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
          onPressed: _saveChanges,
          child: Text('Save'),
        ),
      ],
    );
  }
}
