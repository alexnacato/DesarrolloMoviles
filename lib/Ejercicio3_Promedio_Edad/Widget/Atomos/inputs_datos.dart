import 'package:flutter/material.dart';

class InputsDatos extends StatelessWidget{

  final TextEditingController controller;
  final String label;

  InputsDatos({required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder()
      ),
    );
  }

}