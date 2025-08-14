import 'package:bases/screens/task_form_screen.dart';
import 'package:bases/screens/task_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First App",
      debugShowCheckedModeBanner: false,
      home: TaskFormScreen()
    );
  }
}
