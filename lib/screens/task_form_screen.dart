import 'package:flutter/material.dart';
import 'package:bases/models/task.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? task;

  const TaskFormScreen({super.key, this.task});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  // Contrôleurs pour les champs de texte
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _isDone = false;

  @override
  void initState() {
    super.initState();
    // Initialiser les champs avec les valeurs de la tâche existante (si en mode édition)
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descriptionController.text = widget.task!.description;
      _isDone = widget.task!.isDone;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.task != null;
    final title = isEditing ? 'Modifier la tâche' : 'Nouvelle tâche';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: null,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: null,
            tooltip: 'Sauvegarder',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Titre *',
                  hintText: 'Entrez le titre de la tâche',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                textInputAction: TextInputAction.next,
              ),

              const SizedBox(height: 16),

              // Champ description
              TextFormField(
                maxLines: 3,
                minLines: 3,
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
                value: true,
                activeColor: const Color.fromARGB(255, 30, 128, 0),
                onChanged: (bool value) {
                  setState(() {});
                },
              ),

              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
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
