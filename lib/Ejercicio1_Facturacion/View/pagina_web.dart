import 'package:flutter/material.dart';
import '../Widget/Atoms/custom_button.dart';
import '../Widget/Atoms/custom_textfield.dart';
import '../Controller/compras_controller.dart';
import '../Model/compras_model.dart';

class PaginaWeb extends StatefulWidget {
  const PaginaWeb({super.key});

  @override
  State<PaginaWeb> createState() => _PaginaWebState();
}

class _PaginaWebState extends State<PaginaWeb> {
  final clienteCtrl = TextEditingController();
  final totalCtrl = TextEditingController();
  final controller = FacturaController();

  void _calcularFactura() {
    try {
      final nombre = clienteCtrl.text.trim();
      final totalCompra = totalCtrl.text.trim();

      final factura = controller.calcularFactura(nombre, totalCompra);

      Navigator.pushNamed(context, '/resultado', arguments: factura);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceAll('Exception: ', '')),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Factura - Cálculo de IVA y Descuento')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              label: 'Cliente',
              controller: clienteCtrl,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              label: 'Monto de Compra (\$)',
              controller: totalCtrl,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Calcular Factura',
              onPressed: _calcularFactura,
            ),
          ],
        ),
      ),
    );
  }
}
