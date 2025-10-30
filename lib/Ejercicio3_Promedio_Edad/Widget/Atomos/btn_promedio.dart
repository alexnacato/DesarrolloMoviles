import 'package:flutter/material.dart';

class BtnPromedio extends StatelessWidget{

  final VoidCallback function;
  final String label;


  BtnPromedio({required this.function, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: function,
        child: Text(label)
    );
  }
}