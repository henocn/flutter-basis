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
      home: Scaffold(
        appBar: AppBar(
          title: const Text("First Screen"),
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
          leading: const Icon(Icons.menu),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          ],
        ),
        body: Center(
          child: Image.network(
            "https://i.redd.it/syy0s5x1unbc1.jpeg",
            width: 200,
            height: 100,
            fit: BoxFit.cover,
          ),
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
            print("Bouton flottant pressé !");
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          tooltip: "Ajouter un élément",
        ),
      ),
    );
  }
}
