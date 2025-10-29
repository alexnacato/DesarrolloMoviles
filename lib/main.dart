import 'package:flutter/material.dart';
import 'Ejercicio1_Facturacion/View/pagina_web.dart';
import 'Ejercicio1_Facturacion/View/pagina_resultado.dart';
import 'Ejercicio2_Inversion/View/pagina_inversion.dart';
import 'Ejercicio2_Inversion/View/pagina_resultado.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicios Flutter MVC + Atomic',
      initialRoute: '/',
      routes: {
        '/': (context) => const PaginaMenu(),
        '/factura': (context) => const PaginaWeb(),
        '/resultadoFactura': (context) => const PaginaResultado(),
        '/inversion': (context) => const PaginaInverssion(),
        '/resultadoInversion': (context) => const ResultadoInversion(),
      },
    );
  }
}

class PaginaMenu extends StatelessWidget {
  const PaginaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Principal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/factura'),
              child: const Text('Ejercicio 1: Calcular Factura'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/inversion'),
              child: const Text('Ejercicio 2: Calcular Inversión'),
            ),
          ],
        ),
      ),
    );
  }
}
