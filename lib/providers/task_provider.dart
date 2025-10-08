import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';
import 'package:http/http.dart' as http;

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  int _taskId = 201;

  List<Task> get tasks => _tasks;

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskData = prefs.getString('tasks');
    final idData = prefs.getInt('taskId') ?? 201;

    _taskId = idData;

    if (taskData != null) {
      final List<dynamic> decoded = jsonDecode(taskData);
      _tasks = decoded.map((json) => Task.fromJson(json)).toList();
    } else {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> apiTasks = jsonDecode(response.body);
        _tasks = apiTasks
            .take(10)
            .map(
              (json) => Task(
                id: json['id'],
                title: json['title'],
                description: json['title'],
                completed: json['completed'],
              ),
            )
            .toList();
        _saveToPrefs();
      }
    }

    notifyListeners();
  }

  void addTask(String title, String description) {
    final newTask = Task(id: _taskId++, title: title, description: description);
    _tasks.insert(0, newTask);
    _saveToPrefs();
    notifyListeners();
  }

  void editTask(int id, String title, String description) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index].title = title;
      _tasks[index].description = description;
      _saveToPrefs();
      notifyListeners();
    }
  }

  void deleteTask(int id) {
    _tasks.removeWhere((task) => task.id == id);
    _saveToPrefs();
    notifyListeners();
  }

  void toggleComplete(int id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index].completed = !_tasks[index].completed;
      _saveToPrefs();
      notifyListeners();
    }
  }

  void _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'tasks',
      jsonEncode(_tasks.map((t) => t.toJson()).toList()),
    );
    prefs.setInt('taskId', _taskId);
  }
}
