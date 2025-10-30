import 'package:flutter/material.dart';
import '../Widget/Atomos/inputs_datos.dart';
import '../Controlador/edades_controlador.dart';

class IngresoDatosVista extends StatefulWidget {
  final int numeroSalon;
  final EscuelaController controlador;

  IngresoDatosVista({required this.numeroSalon, required this.controlador});

  @override
  State<IngresoDatosVista> createState() => _IngresoDatosLogica();
}

class _IngresoDatosLogica extends State<IngresoDatosVista> {
  final TextEditingController totalAlumnosCtrl = TextEditingController();
  int totalAlumnos = 0;
  List<TextEditingController> edadesControllers = [];

  void generarCampos() {
    setState(() {
      totalAlumnos = int.tryParse(totalAlumnosCtrl.text) ?? 0;
      edadesControllers = List.generate(totalAlumnos, (_) => TextEditingController());
    });
  }

  void calcularPromedio() {
    List<String> edadesStr = edadesControllers.map((c) => c.text).toList();

    // Registrar en el controlador
    widget.controlador.registrarEdades(widget.numeroSalon, edadesStr);

    double promedio = widget.controlador.obtenerPromedioSalon(widget.numeroSalon);
    double promedioGeneral = widget.controlador.obtenerPromedioGeneral();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Promedios"),
        content: Text(
          "Promedio salón: ${promedio.toStringAsFixed(2)}\nPromedio general: ${promedioGeneral.toStringAsFixed(2)}",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ingresar edades - Salón ${widget.numeroSalon}")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InputsDatos(controller: totalAlumnosCtrl, label: "Cantidad de alumnos"),
            SizedBox(height: 10),
            ElevatedButton(onPressed: generarCampos, child: Text("Generar campos")),
            SizedBox(height: 20),
            for (int i = 0; i < totalAlumnos; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: InputsDatos(
                  controller: edadesControllers[i],
                  label: "Edad del alumno ${i + 1}",
                ),
              ),
            SizedBox(height: 20),
            if (totalAlumnos > 0)
              ElevatedButton(onPressed: calcularPromedio, child: Text("Calcular promedio")),
          ],
        ),
      ),
    );
  }
}
