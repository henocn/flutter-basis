


import 'package:bases/models/task.dart';

class TaskRepository {
  static List<Task> tasks = [];
  static int nbInstance = 0;

  // get by id
  static Task getById(int id) {
    return TaskRepository.tasks[id];
  }

  // Liste des taches
  static List<Task> getAll() {
    return TaskRepository.tasks;
  }

  // création des taches
  static Task createTask(Task task) {
    TaskRepository.tasks.add(task);
    task.id = ++TaskRepository.nbInstance;
    return task;
  }

  // update des tâches
  static Task updateTask(int id, Task task) {
    Task updatedTask = TaskRepository.tasks[id];
    updatedTask.title = task.title;
    updatedTask.description = task.description;
    updatedTask.isDone= task.isDone;
    return updatedTask;
  }

  // delete task
  static void deleteTask(int id) {
    TaskRepository.tasks.removeAt(id);
  }


}