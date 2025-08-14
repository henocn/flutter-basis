import 'package:flutter/material.dart';
import 'package:bases/models/task.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? task;

  const TaskFormScreen({super.key, this.task});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isDoneSwitchValue = false;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      String title = _titleController.text;
      String description = _descriptionController.text;
      bool isDone = isDoneSwitchValue;

      // Créer une instance de la classe Task
      Task task = new Task(title: title, description: description, isDone: isDone);

      print("Formulaire valide !");
    } else {
      print("formulaire invalide");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulaire"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: null,
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
                  child: Text("Enregistrer"),
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
    );
  }
}
