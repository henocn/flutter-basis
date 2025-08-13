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
        body: Center(child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.red,
            child: Icon(Icons.favorite, color: Colors.red, size: 30),
        )),
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
