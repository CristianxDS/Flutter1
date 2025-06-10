import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ejercicios/screens/navigation/Drawer/Drawers.dart'; // Ajusta la ruta si es necesario

class Ejer1 extends StatelessWidget {
  const Ejer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejercicio 04-01")),
      drawer: const MiDrawer(),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _mostrarCalculadoraPropinas(context),
          child: const Text("Abrir Calculadora de Propinas"),
        ),
      ),
    );
  }

  void _mostrarCalculadoraPropinas(BuildContext context) {
    TextEditingController montoController = TextEditingController();
    TextEditingController customTipController = TextEditingController();

    ValueNotifier<double> tipPorcentaje = ValueNotifier(0.15);
    ValueNotifier<String> resultadoTip = ValueNotifier('');
    ValueNotifier<String> resultadoTotal = ValueNotifier('');
    ValueNotifier<String> errorTexto = ValueNotifier('');

    final currencyFormat = NumberFormat.currency(locale: 'es_EC', symbol: '\$');

    void calcular() {
      final monto = double.parse(montoController.text);
      final tipPercent = tipPorcentaje.value == -1
          ? (double.parse(customTipController.text) ?? -1) / 100
          : tipPorcentaje.value;

      if (monto == null || monto <= 0) {
        errorTexto.value = 'Ingrese un monto válido y positivo';
        resultadoTip.value = '';
        resultadoTotal.value = '';
        return;
      }
      if (tipPercent == null || tipPercent < 0) {
        errorTexto.value = 'Ingrese un porcentaje válido';
        resultadoTip.value = '';
        resultadoTotal.value = '';
        return;
      }

      errorTexto.value = '';
      final tipAmount = monto * tipPercent;
      final totalAmount = monto + tipAmount;

      resultadoTip.value = 'Propina: ${currencyFormat.format(tipAmount)}';
      resultadoTotal.value =
          'Total a pagar: ${currencyFormat.format(totalAmount)}';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Calculadora de Propinas'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: montoController,
                  decoration: const InputDecoration(
                    labelText: 'Monto total de la cuenta',
                    prefixText: '\$ ',
                  ),
                  onChanged: (_) => calcular(),
                ),
                const SizedBox(height: 10),
                const Text('Seleccione porcentaje de propina:'),
                ValueListenableBuilder<double>(
                  valueListenable: tipPorcentaje,
                  builder: (context, tipPerc, _) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RadioListTile<double>(
                          title: const Text('10%'),
                          value: 0.10,
                          groupValue: tipPerc,
                          onChanged: (value) {
                            tipPorcentaje.value = value!;
                            calcular();
                          },
                        ),
                        RadioListTile<double>(
                          title: const Text('15%'),
                          value: 0.15,
                          groupValue: tipPerc,
                          onChanged: (value) {
                            tipPorcentaje.value = value!;
                            calcular();
                          },
                        ),
                        RadioListTile<double>(
                          title: const Text('20%'),
                          value: 0.20,
                          groupValue: tipPerc,
                          onChanged: (value) {
                            tipPorcentaje.value = value!;
                            calcular();
                          },
                        ),
                        RadioListTile<double>(
                          title: Row(
                            children: [
                              const Text('Personalizado: '),
                              SizedBox(
                                width: 80,
                                child: TextField(
                                  controller: customTipController,
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  enabled: tipPerc == -1,
                                  decoration: const InputDecoration(
                                    suffixText: '%',
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 8,
                                    ),
                                  ),
                                  onChanged: (_) {
                                    if (tipPerc == -1) calcular();
                                  },
                                ),
                              ),
                            ],
                          ),
                          value: -1,
                          groupValue: tipPerc,
                          onChanged: (value) {
                            tipPorcentaje.value = value!;
                            calcular();
                          },
                        ),
                      ],
                    );
                  },
                ),
                ValueListenableBuilder<String>(
                  valueListenable: errorTexto,
                  builder: (context, error, _) {
                    return error.isEmpty
                        ? const SizedBox.shrink()
                        : Text(
                            error,
                            style: const TextStyle(color: Colors.red),
                          );
                  },
                ),
                const SizedBox(height: 10),
                ValueListenableBuilder<String>(
                  valueListenable: resultadoTip,
                  builder: (context, tip, _) =>
                      Text(tip, style: const TextStyle(fontSize: 16)),
                ),
                ValueListenableBuilder<String>(
                  valueListenable: resultadoTotal,
                  builder: (context, total, _) => Text(
                    total,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
