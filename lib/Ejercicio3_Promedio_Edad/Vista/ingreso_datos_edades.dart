import 'package:flutter/material.dart';
import '../Widget/Atomos/btn_promedio.dart';

class EdadesVista extends StatefulWidget {
  final Function(int) irIngresoEdades;

  EdadesVista({required this.irIngresoEdades});

  @override
  State<EdadesVista> createState() => _EdadesLogica();
}

class _EdadesLogica extends State<EdadesVista> {
  final TextEditingController totalSalonesCtrl = TextEditingController();
  int totalSalones = 0;

  void generarBotones() {
    setState(() {
      totalSalones = int.tryParse(totalSalonesCtrl.text) ?? 0;
    });
  }

  void _irIngreso(int numeroSalon) {
    widget.irIngresoEdades(numeroSalon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Datos por salón")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: totalSalonesCtrl,
              decoration: InputDecoration(
                labelText: "Total de salones",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: generarBotones,
              child: Text("Generar botones"),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: totalSalones,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: BtnPromedio(
                      function: () => _irIngreso(index + 1),
                      label: "Salón ${index + 1}",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
