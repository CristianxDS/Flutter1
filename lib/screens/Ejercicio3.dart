import 'package:flutter/material.dart';

class Ejercicio3 extends StatefulWidget {
  const Ejercicio3({super.key});

  @override
  State<Ejercicio3> createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  final TextEditingController edadController = TextEditingController();
  final TextEditingController experienciaController = TextEditingController();
  String resultado = '';

  void evaluarAptitud() {
    int edad = int.tryParse(edadController.text) ?? 0;
    int experiencia = int.tryParse(experienciaController.text) ?? 0;

    setState(() {
      if (edad >= 25 && edad <= 35 && experiencia >= 3) {
        resultado = 'El aspirante puede ser seleccionado para una entrevista';
      } else {
        resultado =
            'Lo siento, el aspirante no cumple con los requisitos para la entrevista';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Evaluar Aspirante')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: edadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Edad del aspirante'),
            ),
            TextField(
              controller: experienciaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Años de experiencia laboral',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: evaluarAptitud, child: Text('Evaluar')),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(fontSize: 18, color: Colors.indigo),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
