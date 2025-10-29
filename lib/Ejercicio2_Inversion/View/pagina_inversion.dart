import 'package:flutter/material.dart';
import '../Controller/inversion_controller.dart';
import '../Model/inversion_model.dart';
import '../Widget/Molecules/inversion_input.dart';

class PaginaInverssion extends StatefulWidget {
  const PaginaInverssion({super.key});

  @override
  State<PaginaInverssion> createState() => _PaginaInverssionState();
}

class _PaginaInverssionState extends State<PaginaInverssion> {
  final depositoCtrl = TextEditingController();
  final aniosCtrl = TextEditingController();
  final controller = InversionController();

  void calcular() {
    if (depositoCtrl.text.isEmpty || aniosCtrl.text.isEmpty) return;

    final deposito = double.tryParse(depositoCtrl.text) ?? 0;
    final anios = int.tryParse(aniosCtrl.text) ?? 0;

    final resultado = controller.calcularInversion(deposito, anios);

    Navigator.pushNamed(
      context,
      '/resultadoInversion',
      arguments: resultado,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo de Inversión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InversionInputs(
              depositoCtrl: depositoCtrl,
              aniosCtrl: aniosCtrl,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcular,
              child: const Text('Calcular Inversión'),
            ),
          ],
        ),
      ),
    );
  }
}
