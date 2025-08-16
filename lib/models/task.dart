class Task {
  int? id;
  String title;
  String? description;
  bool isDone;

  Task({
    this.id,
    required this.title,
    this.description,
    this.isDone = false,
  });
}