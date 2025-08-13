import 'package:bases/models/task.dart';
import 'package:flutter/material.dart';



class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  // Liste des tâches
  List<Task> tasks = [
    Task(
      title: "Recolter ce que j'ai pas semé",
      description: 'Pour prouver que je ne suis pas voleur',
      isDone: false
    ),
    Task(
      title: 'Voler la poule du voisin',
      description: 'Pour avoir des oeufs',
      isDone: true
    ),
    Task(
      title: 'Manger des oeufs',
      description: 'Pour avoir des un bon ventre',
      isDone: false
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Taches"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        leading: const Icon(Icons.arrow_back),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
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
                task.description,
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
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    tooltip: 'Modifier',
                  ),
                  // Bouton Delete
                  IconButton(
                    onPressed: () => {},
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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Liste"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_sharp),
            label: "Parametres",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_sharp),
            label: "Parametres",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ici vous pouvez ajouter la logique pour ajouter une nouvelle tâche
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ajouter une nouvelle tâche'),
              backgroundColor: Colors.green,
            ),
          );
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        tooltip: "Ajouter un élément",
      ),
    );
  }
}
