import 'package:ejercicios/screens/navigation/Drawer/Drawers.dart';
import 'package:flutter/material.dart';

final TextEditingController capitalController = TextEditingController();
final TextEditingController interesController = TextEditingController();
final TextEditingController tiempoController = TextEditingController();

final ValueNotifier<String> resultado = ValueNotifier('');
final ValueNotifier<String> error = ValueNotifier('');

class Ejer2 extends StatelessWidget {
  const Ejer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejercicio 04-02")),
      drawer: const MiDrawer(),
      body: Center(
        child: ElevatedButton(
          child: const Text("Calculadora de Interés Simple"),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => CalculadoraInteresSimple(),
            );
          },
        ),
      ),
    );
  }
}

class CalculadoraInteresSimple extends StatelessWidget {
  const CalculadoraInteresSimple({super.key});

  void calcular() {
    final capital = double.tryParse(capitalController.text);
    final interes = double.tryParse(interesController.text);
    final tiempo = double.tryParse(tiempoController.text);

    if (capital == null ||
        interes == null ||
        tiempo == null ||
        capital <= 0 ||
        interes <= 0 ||
        tiempo <= 0) {
      error.value = 'Todos los valores deben ser numéricos y positivos';
      resultado.value = '';
      return;
    }

    error.value = '';
    final montoFinal = capital * (1 + (interes * tiempo / 100));
    final interesGenerado = montoFinal - capital;

    resultado.value =
        'Capital Inicial: \$${capital.toStringAsFixed(2)}\n'
        'Interés Generado: \$${interesGenerado.toStringAsFixed(2)}\n'
        'Monto Final: \$${montoFinal.toStringAsFixed(2)}';
  }

  void limpiar() {
    capitalController.clear();
    interesController.clear();
    tiempoController.clear();
    resultado.value = '';
    error.value = '';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Calculadora de Interés Simple'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: capitalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Capital inicial'),
            ),
            TextField(
              controller: interesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tasa de interés anual (%)',
              ),
            ),
            TextField(
              controller: tiempoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Tiempo (años)'),
            ),
            const SizedBox(height: 10),
            ValueListenableBuilder(
              valueListenable: error,
              builder: (_, value, __) =>
                  Text(value, style: const TextStyle(color: Colors.red)),
            ),
            const SizedBox(height: 10),
            ValueListenableBuilder(
              valueListenable: resultado,
              builder: (_, value, __) => Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: limpiar, child: const Text("Limpiar")),
        TextButton(onPressed: calcular, child: const Text("Calcular")),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cerrar"),
        ),
      ],
    );
  }
}
