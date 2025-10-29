import 'package:flutter/material.dart';
import '../Model/inversion_model.dart';

class ResultadoInversion extends StatelessWidget {
  const ResultadoInversion({super.key});

  @override
  Widget build(BuildContext context) {
    final inversion = ModalRoute.of(context)!.settings.arguments as Inversion;

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado de Inversión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Depósito mensual: \$${inversion.depositoMensual.toStringAsFixed(2)}'),
            Text('Años de inversión: ${inversion.anios}'),
            Text('Interés anual: ${(inversion.interesAnual * 100).toStringAsFixed(1)}%'),
            const SizedBox(height: 20),
            const Text('Totales acumulados por año:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: inversion.totalesPorAnio.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('Año ${index + 1}:'),
                    title: Text(
                      '\$${inversion.totalesPorAnio[index].toStringAsFixed(2)}',
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Volver'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
