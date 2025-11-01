import 'package:flutter/material.dart';

// Ojo: importar solo los modelos, controladores y vistas del Ejercicio 3
import 'Ejercicio3_Promedio_Edad/Vista/ingreso_datos_salon.dart';
import 'Ejercicio3_Promedio_Edad/Vista/ingreso_datos_edades.dart';
import 'Ejercicio3_Promedio_Edad/Controlador/edades_controlador.dart';
import 'Ejercicio3_Promedio_Edad/Modelo/escuela_model.dart';

import 'Ejercicio1_Facturacion/View/pagina_web.dart';
import 'Ejercicio1_Facturacion/View/pagina_resultado.dart';
import 'Ejercicio2_Inversion/View/pagina_inversion.dart';
import 'Ejercicio2_Inversion/View/pagina_resultado.dart';
import 'Ejercicio4_CajaRegistradora/Vista/datos_vista.dart';
import 'Ejercicio4_CajaRegistradora/Vista/resultado_vista.dart';
import 'Ejercicio5_ventas/Vista/ventasView.dart';

void main() {
  // Crear el modelo y controlador para Ejercicio 3
  final escuela = Escuela(totalSalones: 8); // Por ejemplo 8 salones
  final controlador = EscuelaController(escuela: escuela);

  runApp(MyApp(controlador: controlador));
}

class MyApp extends StatelessWidget {
  final EscuelaController controlador;

  const MyApp({super.key, required this.controlador});

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
        // Rutas de nuestro Ejercicio 3 con controlador
        '/ingresoSalon': (context) => EdadesVista(
          irIngresoEdades: (numeroSalon) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => IngresoDatosVista(
                  numeroSalon: numeroSalon,
                  controlador: controlador,
                ),
              ),
            );
          },
        ),
        '/ingresoCajaRegistradora': (context) =>  datosVista(),
        '/cajaRegistradoResultado': (context) =>  ResultadoVista(),
        '/ventas': (context) => VentasView(),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/ingresoSalon'),
              child: const Text('Ejercicio 3: Calcular Promedio'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/ingresoCajaRegistradora'),
              child: const Text('Ejercicio 4: Caja Registradora'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/ventas'),
              child: const Text('Ejercicio 5: Ventas'),
            ),
          ],
        ),
      ),
    );
  }
}
