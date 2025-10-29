import 'package:flutter/material.dart';
import '../Atoms/custom_textfield.dart';

class VentaInputs extends StatelessWidget {
  final TextEditingController clienteCtrl;
  final TextEditingController totalCtrl;

  const VentaInputs({
    super.key,
    required this.clienteCtrl,
    required this.totalCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
