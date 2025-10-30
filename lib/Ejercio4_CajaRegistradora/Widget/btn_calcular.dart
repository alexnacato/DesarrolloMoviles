import 'package:flutter/material.dart';

class btnCalcular extends StatelessWidget{

  final VoidCallback funcion;
  final String label;

  btnCalcular({required this.funcion,required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: funcion,
        child: Text(label)
    );
  }

}