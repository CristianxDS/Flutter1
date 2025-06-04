import 'package:flutter/material.dart';

// Controladores globales
TextEditingController _edad = TextEditingController();
TextEditingController _nivel = TextEditingController();
TextEditingController _promedio = TextEditingController();

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejercicio 1")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Bienvenido al Ejercicio 1",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Evaluar(context),
          ],
        ),
      ),
    );
  }
}

Widget Evaluar(context) {
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Nombre del Estudiante"),
        ),
      ),
      SizedBox(height: 20),
      TextField(
        controller: _edad,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Edad del Estudiante"),
        ),
      ),
      SizedBox(height: 20),
      TextField(
        controller: _nivel,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Nivel de inglés del Estudiante"),
        ),
      ),
      SizedBox(height: 20),
      TextField(
        controller: _promedio,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Promedio del Estudiante"),
        ),
      ),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () => evaluarEstudiante(context),
        child: Text("EVALUAR"),
      ),
    ],
  );
}

void evaluarEstudiante(BuildContext context) {
  int edad = int.parse(_edad.text) ;
  String nivel = _nivel.text.toLowerCase().trim();
  double promedio = double.parse(_promedio.text) ;

  String mensaje;
if (edad >= 16 && edad <= 25 && (nivel == "intermedio" || nivel == "avanzado") && promedio >= 8) {
  mensaje = "El estudiante es apto para participar en el programa de intercambio.";
} else {
  mensaje = "El estudiante no cumple con los requisitos para el programa de intercambio.";
}

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Resultado"),
        content: Text(mensaje),
        actions: [
          TextButton(
            child: Text("Cerrar"),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
        ],
      );
    },
  );
}
