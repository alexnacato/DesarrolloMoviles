import 'package:flutter/material.dart';

class ResultadoVista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final total = ModalRoute.of(context)!.settings.arguments as double;

    return Scaffold(
      appBar: AppBar(title: Text("Resultado")),
      body: Center(
        child: total == -1
            ? AlertDialog(
          title: Text("Error"),
          content: Text("Por favor, llene todos los campos correctamente."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Aceptar"),
            ),
          ],
        )
            : Text(
          "Total calculado: \$${total.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
