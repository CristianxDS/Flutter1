import 'package:ejercicios/screens/Ejercicio1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Entrega1());
}

class Entrega1 extends StatelessWidget {
  const Entrega1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
      debugShowCheckedModeBanner: false, 
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejercicios")),
      body: Center(
        child: btnEjercicio1(context), 
      ),
    );
  }
}

Widget btnEjercicio1(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Ejercicio1()),
      );
    },
    child: const Text("Ejercicio 1"),
  );
}
