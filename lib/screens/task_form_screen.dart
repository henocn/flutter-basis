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

  // Méthode pour sauvegarder la tâche
  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      final task = Task(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        isDone: _isDone,
      );

      // Retourner la tâche créée/modifiée
      Navigator.pop(context, task);
    }
  }

  // Méthode pour annuler et retourner à l'écran précédent
  void _cancel() {
    Navigator.pop(context);
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
          onPressed: _cancel,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveTask,
            tooltip: 'Sauvegarder',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Champ titre
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Titre *',
                  hintText: 'Entrez le titre de la tâche',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Le titre est requis';
                  }
                  if (value.trim().length < 3) {
                    return 'Le titre doit contenir au moins 3 caractères';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // Champ description
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Entrez la description de la tâche',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 3,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 16),

              // Checkbox pour marquer comme terminée
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isDone,
                        onChanged: (value) {
                          setState(() {
                            _isDone = value ?? false;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      const Expanded(
                        child: Text(
                          'Marquer comme terminée',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Boutons d'action
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _cancel,
                      icon: const Icon(Icons.cancel),
                      label: const Text('Annuler'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _saveTask,
                      icon: const Icon(Icons.save),
                      label: Text(isEditing ? 'Modifier' : 'Créer'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}