import 'package:bases/models/task.dart';
import 'package:bases/repositories/task_repository.dart';
import 'package:bases/screens/task_form_screen.dart';
import 'package:flutter/material.dart';



class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  // Liste des tâches
  List<Task> tasks = [];

  // Initialisation de l'état avnat de passer au build et se fait une seule fois 
  // Au chargement du composant
  @override
  void initState(){
    super.initState();
    setState(() {
      tasks = TaskRepository.getAll();
    });
  }

  // Rafraîchit la liste après un retour d'écran ou une action CRUD
  void _refreshTasks() {
    setState(() {});
  }

  // Construit l'interface listant les tâches avec actions CRUD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Taches"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        leading: const Icon(Icons.task_rounded),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              title: Text(
                task.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration:
                      task.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Text(
                task.description ?? "",
                style: TextStyle(
                  color: Colors.grey[600],
                  decoration:
                      task.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Bouton Edit
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TaskFormScreen(
                            task: task,
                            taskIndex: index,
                          ),
                        ),
                      ).then((_) => _refreshTasks());
                    },
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    tooltip: 'Modifier',
                  ),
                  // Bouton Delete
                  IconButton(
                    onPressed: () {
                      TaskRepository.deleteTask(index);
                      _refreshTasks();
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                    tooltip: 'Supprimer',
                  ),
                ],
              )
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushNamed(context, "/form").then((_) => _refreshTasks());
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Liste"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business),
            label: "Ajouter",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/form").then((_) => _refreshTasks());
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        tooltip: "Ajouter un élément",
      ),
    );
  }
}