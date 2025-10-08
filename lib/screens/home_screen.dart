import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/task_list.dart';
import '../providers/task_provider.dart';
// import '../widgets/task_item.dart';
import '../screens/add_task_dialog.dart';
import '../screens/edit_task_dialog.dart';
import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _filter = 'all'; // all, completed, pending
  Task? _editingTask;

  @override
  void initState() {
    super.initState();
    Provider.of<TaskProvider>(context, listen: false).loadTasks();
  }

  List<Task> _applyFilter(List<Task> tasks) {
    if (_filter == 'completed') return tasks.where((t) => t.completed).toList();
    if (_filter == 'pending') return tasks.where((t) => !t.completed).toList();
    return tasks;
  }

  void _openAddTaskDialog() {
    showDialog(context: context, builder: (_) => AddTaskDialog());
  }

  void _openEditTaskDialog(Task task) {
    showDialog(
      context: context,
      builder: (_) => EditTaskDialog(task: task),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;
    final filteredTasks = _applyFilter(tasks);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.filter_list),
            onSelected: (val) => setState(() => _filter = val),
            itemBuilder: (ctx) => [
              PopupMenuItem(value: 'all', child: Text('All')),
              PopupMenuItem(value: 'completed', child: Text('Completed')),
              PopupMenuItem(value: 'pending', child: Text('Pending')),
            ],
          ),
        ],
      ),

      body: TaskList(tasks: filteredTasks, onEdit: _openEditTaskDialog),

      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTaskDialog,
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
      ),
    );
  }
}
