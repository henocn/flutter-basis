


import 'package:bases/models/task.dart';

class TaskRepository {
  static List<Task> tasks = [];

  // get by id
  Task getById(int id) {
    return TaskRepository.tasks[id];
  }

  // Liste des taches
  List<Task> getAll() {
    return TaskRepository.tasks;
  }

  // création des taches
  Task createTask(Task task) {
    TaskRepository.tasks.add(task);
    return task;
  }

  // update des tâches
  Task updateTask(int id, Task task) {
    Task updatedTask = TaskRepository.tasks[id];
    updatedTask.title = task.title;
    updatedTask.description = task.description;
    updatedTask.isDone= task.isDone;
    return task;
  }

  // delete task
  void deleteTask(int id) {
    TaskRepository.tasks.removeAt(id);
  }


}