
import 'package:flutter/material.dart';
import '../Controlador/ventasController.dart';
import 'Widgets/Molecules/addSaleForm.dart';
import 'Widgets/Organisms/salesReport.dart';

class VentasView extends StatefulWidget {
  @override
  _VentasViewState createState() => _VentasViewState();
}

class _VentasViewState extends State<VentasView> {
  final VentasController _controller = VentasController();
  final TextEditingController _montoController = TextEditingController();

  void _agregarVenta() {
    final monto = double.tryParse(_montoController.text);
    if (monto != null) {
      setState(() {
        _controller.agregarVenta(monto);
      });
      _montoController.clear();
    } else {
      // Mostrar un error si el monto no es válido
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingrese un monto válido.')),
      );
    }
  }

  void _limpiarVentas() {
    setState(() {
      _controller.limpiarVentas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Ventas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _limpiarVentas,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AddSaleForm(
              controller: _montoController,
              onChanged: (value) {},
              onAddSalePressed: _agregarVenta,
            ),
            const SizedBox(height: 20),
            SalesReport(report: _controller.reporte),
          ],
        ),
      ),
    );
  }
}
