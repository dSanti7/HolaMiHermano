import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget es la raíz de tu aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const ParentWidget(),
    );
  }
}

// 1. El widget HIJO (Stateless)
// Recibe datos y una función, pero no tiene estado propio.
class ChildWidget extends StatelessWidget {
  final String text;
  final VoidCallback onButtonPressed; // VoidCallback es un tipo para funciones sin parámetros

  const ChildWidget({
    super.key,
    required this.text,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text), // Muestra el texto recibido del padre
        TextButton(
          onPressed: onButtonPressed,
          // Al pulsar, Llama a la función recibida del padre
          child: const Text('TextButton Cambiar Texto desde el Hijo'),
        ),

         ElevatedButton(
          onPressed: onButtonPressed,
          // Al pulsar, Llama a la función recibida del padre
          child: const Text('ElevatedButton Cambiar Texto desde el Hijo'),
        ), // Muestra el texto recibido del padre
        OutlinedButton(
          onPressed: onButtonPressed,
          // Al pulsar, Llama a la función recibida del padre
          child: const Text('OutlinedButton Cambiar Texto desde el Hijo'),
        ),IconButton(
          onPressed: onButtonPressed,
          // Al pulsar, Llama a la función recibida del padre
          icon: Icon(Icons.favorite),
        ),FloatingActionButton(
          onPressed: onButtonPressed,
          // Al pulsar, Llama a la función recibida del padre
          child: const Text('FloatingActionButton Cambiar Texto desde el Hijo'),
        ),GestureDetector(
          onTap: onButtonPressed,
          // Al pulsar, Llama a la función recibida del padre
          child: const Text('GestureDetector Cambiar Texto desde el Hijo'),
        ),InkWell(
          onTap: onButtonPressed,
          // Al pulsar, Llama a la función recibida del padre
          child: const Text('InkWell Cambiar Texto desde el Hijo'),
        ),
      ],
    );
  }
}

// 2. El widget PADRE (Stateful)
// Gestiona el estado y se lo pasa al hijo.
class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String _currentText = 'Hola desde el Padre';

  // 3. Esta es la función que el padre le pasa al hijo.
  void _updateText() {
    setState(() {
      // Cambia el estado y reconstruye la UI
      _currentText = '¡El hijo ha cambiado el texto!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplo Padre-Hijo')),
      body: Center(
        // 4. El padre crea al hijo, pasándole el estado actual
        // y la función que el hijo puede llamar.
        child: ChildWidget(
          text: _currentText,
          onButtonPressed: _updateText,
        ),
      ),
    );
  }
}

