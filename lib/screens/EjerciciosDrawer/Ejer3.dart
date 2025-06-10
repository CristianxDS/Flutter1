import 'package:ejercicios/screens/navigation/Drawer/Drawers.dart';
import 'package:flutter/material.dart';

final TextEditingController ahorroMensualController = TextEditingController();
final TextEditingController mesesController = TextEditingController();

final ValueNotifier<String> resultadoTotal = ValueNotifier('');
final ValueNotifier<List<String>> detalleMeses = ValueNotifier([]);
final ValueNotifier<String> errorTexto = ValueNotifier('');

class Ejer3 extends StatelessWidget {
  const Ejer3({super.key});

  void calcularAhorro() {
    final double? ahorroMensual = double.tryParse(ahorroMensualController.text);
    final int? cantidadMeses = int.tryParse(mesesController.text);

    if (ahorroMensual == null ||
        ahorroMensual <= 0 ||
        cantidadMeses == null ||
        cantidadMeses <= 0) {
      errorTexto.value = 'Ingrese valores válidos y positivos';
      resultadoTotal.value = '';
      detalleMeses.value = [];
      return;
    }

    errorTexto.value = '';
    double total = ahorroMensual * cantidadMeses;
    resultadoTotal.value = 'Total ahorrado: \$${total.toStringAsFixed(2)}';

    List<String> detalle = [];
    for (int i = 1; i <= cantidadMeses; i++) {
      detalle.add('Mes $i: \$${(ahorroMensual * i).toStringAsFixed(2)}');
    }
    detalleMeses.value = detalle;
  }

  void limpiarCampos() {
    ahorroMensualController.clear();
    mesesController.clear();
    resultadoTotal.value = '';
    detalleMeses.value = [];
    errorTexto.value = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejercicio 04-03")),
      drawer: const MiDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Simulador de Ahorro Mensual",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: ahorroMensualController,
              decoration: const InputDecoration(labelText: 'Ahorro mensual'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: mesesController,
              decoration: const InputDecoration(labelText: 'Cantidad de meses'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: calcularAhorro,
                  child: const Text("Calcular"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: limpiarCampos,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  child: const Text("Limpiar"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder<String>(
              valueListenable: errorTexto,
              builder: (context, value, _) => value.isNotEmpty
                  ? Text(value, style: const TextStyle(color: Colors.red))
                  : const SizedBox(),
            ),
            ValueListenableBuilder<String>(
              valueListenable: resultadoTotal,
              builder: (context, value, _) => value.isNotEmpty
                  ? Text(
                      value,
                      style: const TextStyle(fontSize: 18, color: Colors.green),
                    )
                  : const SizedBox(),
            ),
            const SizedBox(height: 10),
            ValueListenableBuilder<List<String>>(
              valueListenable: detalleMeses,
              builder: (context, lista, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: lista.map((item) => Text(item)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
