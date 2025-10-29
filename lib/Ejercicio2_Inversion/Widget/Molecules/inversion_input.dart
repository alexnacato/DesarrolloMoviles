import 'package:flutter/material.dart';
import '../Atoms/custom_textfield.dart';

class InversionInputs extends StatelessWidget {
  final TextEditingController depositoCtrl;
  final TextEditingController aniosCtrl;

  const InversionInputs({
    super.key,
    required this.depositoCtrl,
    required this.aniosCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'Depósito mensual (\$)',
          controller: depositoCtrl,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          label: 'Años de inversión',
          controller: aniosCtrl,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
