import 'package:ejercicios/screens/Ejercicio1.dart';
import 'package:ejercicios/screens/Ejercicio2.dart';
import 'package:ejercicios/screens/Ejercicio3.dart';
import 'package:ejercicios/screens/EjerciciosDrawer/Ejer1.dart';
import 'package:ejercicios/screens/EjerciciosDrawer/Ejer2.dart';
import 'package:ejercicios/screens/EjerciciosDrawer/Ejer3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Entrega1());
}

class Entrega1 extends StatelessWidget {
  const Entrega1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Cuerpo(), debugShowCheckedModeBanner: false);
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejercicios")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            btnEjercicio1(context),
            SizedBox(height: 20),
            btnEjercicio2(context),
            SizedBox(height: 20),
            btnEjercicio3(context),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("EJERCICIO 04 1"),
              onTap: () {
                Navigator.pop(context); // <-- Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejer1()),
                );
              },
            ),
            ListTile(
              title: Text("EJERCICIO 04 2"),
              onTap: () {
                Navigator.pop(context); // <-- Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejer2()),
                );
              },
            ),
            ListTile(
              title: Text("EJERCICIO 04 3"),
              onTap: () {
                Navigator.pop(context); // <-- Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejer3()),
                );
              },
            ),
          ],
        ),
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

Widget btnEjercicio2(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Ejercicio2()),
      );
    },
    child: const Text("Ejercicio 2"),
  );
}

Widget btnEjercicio3(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Ejercicio3()),
      );
    },
    child: const Text("Ejercicio 3"),
  );
}
