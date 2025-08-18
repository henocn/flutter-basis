import 'package:bases/repositories/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:bases/models/task.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? task;
  final int? taskIndex;

  const TaskFormScreen({super.key, this.task, this.taskIndex});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isDoneSwitchValue = false;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  // Initialise l'écran et pré-remplit le formulaire si on édite une tâche
  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descriptionController.text = widget.task!.description ?? '';
      isDoneSwitchValue = widget.task!.isDone;
    }
  }

  // Libère les contrôleurs quand l'écran est détruit
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // Valide le formulaire et crée ou met à jour une tâche
  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      String title = _titleController.text;
      String description = _descriptionController.text;
      bool isDone = isDoneSwitchValue;

      // Créer une instance de la classe Task
      Task task = new Task(title: title, description: description, isDone: isDone);
      if (widget.task == null) {
        // Création
        TaskRepository.createTask(task);
      } else {
        // Mise à jour
        TaskRepository.updateTask(widget.taskIndex!, task);
      }
      _titleController.clear();
      _descriptionController.clear();

      setState(() {
        isDoneSwitchValue = false;
      });

      Navigator.pop(context);

      print(task.toString());

      print("Formulaire valide !");
    } else {
      print("formulaire invalide");
    }
  }

  // Construit l'interface du formulaire de tâche
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? "Nouvelle tâche" : "Modifier la tâche"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Titre *',
                  hintText: 'Entrez le titre de la tâche',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                textInputAction: TextInputAction.next,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "This is required";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Champ description
              TextFormField(
                maxLines: 3,
                minLines: 3,
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: "Saisir une description",
                  labelText: "Description",
                  floatingLabelStyle: TextStyle(
                    color: Color.fromARGB(255, 30, 128, 0),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 30, 128, 0),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Checkbox pour marquer comme terminée
              const SizedBox(height: 16),
              Switch(
                value: isDoneSwitchValue,
                activeColor: const Color.fromARGB(255, 30, 128, 0),
                onChanged: (bool value) {
                  setState(() {
                    isDoneSwitchValue = value;
                  });
                },
              ),

              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveTask,
                  child: Text(widget.task == null ? "Enregistrer" : "Mettre à jour"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(28),
                    backgroundColor: Color.fromARGB(255, 30, 128, 0),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if (index == 0) {
            Navigator.pop(context);
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
    );
  }
}
