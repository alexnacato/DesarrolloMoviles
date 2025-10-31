
import 'package:flutter/material.dart';
import '../Atoms/inputField.dart';
import '../Atoms/button.dart';

class AddSaleForm extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback onAddSalePressed;

  const AddSaleForm({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.onAddSalePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputField(
            controller: controller,
            labelText: 'Monto de la venta',
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 10),
        Button(
          text: 'Agregar Venta',
          onPressed: onAddSalePressed,
        ),
      ],
    );
  }
}
