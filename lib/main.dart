import 'package:bases/screens/task_form_screen.dart';
import 'package:bases/screens/task_list_screen.dart';
import 'package:flutter/material.dart';

// Point d'entrée de l'application
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  // Construit la racine de l'application avec la configuration de navigation
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First App",
      debugShowCheckedModeBanner: false,
      // home: TaskListScreen()
      initialRoute: "/",
      routes: {
        "/": (context) => const TaskListScreen(),
        "/form": (context) => const TaskFormScreen()
      },
    );
  }
}
