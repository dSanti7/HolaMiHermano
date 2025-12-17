import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const Inicio());
  }
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            '😃 - Inicio - 😃',
            style: TextStyle(color: Colors.purple, fontSize: 100),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        toolbarHeight: 120,
      ),
      // Usamos una Column para las dos filas
      body: Column(
        children: [
          // Expanded hace que cada Row ocupe la mitad de la pantalla
          Expanded(
            child: Row(
              // stretch hace que los hijos llenen el eje transversal (alto)
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Expanded hace que cada widget ocupe la mitad de la fila
                Expanded(
                  // La imagen se ajustará para cubrir todo el espacio asignado
                  child: Image.asset(
                    "assets/img_anime_1.webp",
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.lightGreen,
                    child: Center(child: Text("2 texto")),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.orange,
                    child: Center(child: Text("3 texto")),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.lightBlueAccent,
                    child: Center(child: Text("4 texto")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
