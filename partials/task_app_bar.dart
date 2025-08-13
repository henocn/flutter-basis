import 'package:flutter/material.dart';

class TaskAppBar extends StatelessWidget {
  const TaskAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("First Screen"),
      backgroundColor: Colors.green,
      foregroundColor: Colors.black,
      leading: const Icon(Icons.menu),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
    );
  }
}
