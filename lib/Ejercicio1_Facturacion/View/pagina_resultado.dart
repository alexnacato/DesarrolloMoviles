import 'package:flutter/material.dart';
import '../Model/compras_model.dart';

class PaginaResultado extends StatelessWidget {
  const PaginaResultado({super.key});

  @override
  Widget build(BuildContext context) {
   
    final factura = ModalRoute.of(context)!.settings.arguments as Factura;

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado de la Factura')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cliente: ${factura.cliente}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Divider(),
                Text('Subtotal: \$${factura.subtotal.toStringAsFixed(2)}'),
                Text('IVA (15%): \$${factura.iva.toStringAsFixed(2)}'),
                Text('Descuento: \$${factura.descuento.toStringAsFixed(2)}'),
                const Divider(),
                Text('Total a Pagar: \$${factura.total.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 10),
                Text('Sueldo del Vendedor: \$${factura.sueldoVendedor.toStringAsFixed(2)}'),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Volver'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
