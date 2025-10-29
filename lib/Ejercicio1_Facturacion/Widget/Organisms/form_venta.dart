import 'package:flutter/material.dart';
import '../Atoms/custom_button.dart';
import '../Molecules/VentaInputs.dart';
import '../../Controller/compras_controller.dart';
import '../../Model/compras_model.dart';

class FormVenta extends StatefulWidget {
  const FormVenta({super.key});

  @override
  State<FormVenta> createState() => _FormVentaState();
}

class _FormVentaState extends State<FormVenta> {
  final clienteCtrl = TextEditingController();
  final totalCtrl = TextEditingController();
  final controller = FacturaController();

  void _calcularFactura() {
    final nombre = clienteCtrl.text.trim();
    final totalCompra = totalCtrl.text.trim();

    final factura = controller.calcularFactura(nombre, totalCompra);
    Navigator.pushNamed(context, '/factura', arguments: factura);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        VentaInputs(
          clienteCtrl: clienteCtrl,
          totalCtrl: totalCtrl,
        ),
        const SizedBox(height: 20),
        CustomButton(
          text: 'Calcular Factura',
          onPressed: _calcularFactura,
        ),
      ],
    );
  }
}
