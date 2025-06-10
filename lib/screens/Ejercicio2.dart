import 'package:flutter/material.dart';

class Ejercicio2 extends StatefulWidget {
  const Ejercicio2({super.key});

  @override
  State<Ejercicio2> createState() => _Ejercicio2State();
}

class _Ejercicio2State extends State<Ejercicio2> {
  final TextEditingController promedioController = TextEditingController();
  final TextEditingController ingresoController = TextEditingController();
  String resultado = '';

  void verificarElegibilidad() {
    double promedio = double.tryParse(promedioController.text) ?? 0;
    double ingreso = double.tryParse(ingresoController.text) ?? 0;

    setState(() {
      if (promedio >= 9.0 && ingreso < 3000) {
        resultado = 'El estudiante es elegible para la beca';
      } else {
        resultado = 'Lo siento, el estudiante no es elegible para la beca';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verificar Beca')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: promedioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Promedio del estudiante'),
            ),
            TextField(
              controller: ingresoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingreso mensual de la familia',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: verificarElegibilidad,
              child: Text('Verificar'),
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 165, 85, 39),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
