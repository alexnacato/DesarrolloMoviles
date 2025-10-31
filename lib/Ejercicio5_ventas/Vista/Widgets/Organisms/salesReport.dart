import 'package:flutter/material.dart';
import '../../../Modelo/ventasModelo.dart';

class SalesReport extends StatelessWidget {
  final ReporteVentas report;

  const SalesReport({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildReportCard(
              context: context,
              title: 'Ventas <= 10,000',
              icon: Icons.shopping_cart_checkout,
              children: [
                ListTile(
                  title: const Text('Cantidad de Ventas'),
                  trailing: Text(report.cantidadVentasMenorOIgual10k.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  title: const Text('Monto Total'),
                  trailing: Text('\$${report.montoVentasMenorOIgual10k.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildReportCard(
              context: context,
              title: 'Ventas > 10,000 y < 20,000',
              icon: Icons.add_shopping_cart,
              children: [
                ListTile(
                  title: const Text('Cantidad de Ventas'),
                  trailing: Text(report.cantidadVentasEntre10kY20k.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  title: const Text('Monto Total'),
                  trailing: Text('\$${report.montoVentasEntre10kY20k.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildReportCard(
              context: context,
              title: 'Resumen Global',
              icon: Icons.monetization_on,
              isPrimary: true,
              children: [
                ListTile(
                  title: const Text('Monto Global de Ventas', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70)),
                  trailing: Text(
                    '\$${report.montoGlobal.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required List<Widget> children,
    bool isPrimary = false,
  }) {
    final theme = Theme.of(context);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isPrimary ? theme.primaryColor : theme.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(icon, color: isPrimary ? Colors.white : theme.primaryColor, size: 40),
              title: Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isPrimary ? Colors.white : theme.textTheme.titleLarge?.color,
                ),
              ),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }
}
