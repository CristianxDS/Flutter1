import 'package:flutter/material.dart';
import 'package:ejercicios/screens/EjerciciosDrawer/Ejer1.dart';
import 'package:ejercicios/screens/EjerciciosDrawer/Ejer2.dart';
import 'package:ejercicios/screens/EjerciciosDrawer/Ejer3.dart';
import 'package:ejercicios/main.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.purple),
            child: Column(
              children: [
                Text("HOME", style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 10),
                Expanded(child: Image.asset("assets/images/logo.png")),
              ],
            ),
          ),
          ListTile(
            title: Text("EJERCICIO 1"),
            onTap: () {
              Navigator.pop(context); // cierra drawer
              Navigator.pushReplacement( // reemplaza la ruta actual (opcional)
                context,
                MaterialPageRoute(builder: (context) => const Ejer1()),
              );
            },
          ),
          ListTile(
            title: Text("EJERCICIO 2"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Ejer2()),
              );
            },
          ),
          ListTile(
            title: Text("EJERCICIO 3"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Ejer3()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Entrega1()),
              );
            },
          ),
        ],
      ),
    );
  }
}
