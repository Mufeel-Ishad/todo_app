
# Flutter To-Do App

A simple and functional **To-Do List app** built with **Flutter**. This app allows users to manage tasks with features like adding, editing, deleting, toggling completion, and filtering tasks. It stores data locally using **SharedPreferences** and can sync tasks with a public API (JSONPlaceholder).

## Features

- **Add Task**: Allows users to add new tasks with a title and description.
- **Edit Task**: Edit existing tasks' title and description.
- **Delete Task**: Remove tasks from the list.
- **Mark Task as Completed**: Toggle tasks as completed or pending.
- **Filter Tasks**: Filter tasks by **All**, **Completed**, or **Pending**.
- **Persist Tasks Locally**: Uses **SharedPreferences** to store tasks offline.
- **Fetch Tasks from API**: Initially loads tasks from **JSONPlaceholder** API.

## Tech Stack

- **Flutter**: Framework used to build the app.
- **Provider**: For state management.
- **SharedPreferences**: For local data persistence (similar to `localStorage` in web apps).
- **http**: For API calls to fetch tasks.
- **Material UI**: Native Flutter Material Design components.

## Installation

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/flutter-todo-app.git
cd flutter-todo-app
```

### 2. Install Dependencies
Make sure you have **Flutter** installed. Then, run:
```bash
flutter pub get
```

### 3. Run the App
To run the app, use the following command:
```bash
flutter run
```

## App Structure

```
lib/
│
├── main.dart                    ← Entry point of the app
├── models/
│   └── task.dart                ← Task data model
├── providers/
│   └── task_provider.dart       ← State management logic
├── screens/
│   ├── home_screen.dart         ← Main screen with task list and filter
│   ├── add_task_dialog.dart     ← Modal for adding tasks
│   └── edit_task_dialog.dart    ← Modal for editing tasks
├── widgets/
│   ├── task_item.dart           ← Displays individual task
│   └── task_list.dart           ← Displays the list of tasks
```

## Usage

1. **Viewing Tasks**: On startup, the app loads tasks either from **local storage** or **JSONPlaceholder API**.
2. **Adding a Task**: Tap the **FAB** button to open a modal to add a new task.
3. **Editing a Task**: Tap the **Edit** icon on a task to modify it.
4. **Deleting a Task**: Tap the **Delete** icon to remove a task.
5. **Marking a Task as Completed**: Toggle the **Switch** next to each task to mark it as completed.
6. **Filtering Tasks**: Use the **filter menu** to toggle between All, Completed, and Pending tasks.

## Screenshots

(You can add some screenshots of the app here!)

---

## Contributing

1. Fork the repo.
2. Create a new branch (`git checkout -b feature-xyz`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-xyz`).
5. Open a Pull Request.


