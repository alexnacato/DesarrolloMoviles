
import '../Modelo/ventasModelo.dart';

class VentasController {
  final List<double> _ventas = [];
  ReporteVentas _reporte = ReporteVentas();

  ReporteVentas get reporte => _reporte;

  void agregarVenta(double monto) {
    _ventas.add(monto);
    _calcularReporte();
  }

  void _calcularReporte() {
    int cantidadMenorOIgual10k = 0;
    double montoMenorOIgual10k = 0;
    int cantidadEntre10kY20k = 0;
    double montoEntre10kY20k = 0;
    double montoGlobal = 0;

    for (var venta in _ventas) {
      if (venta <= 10000) {
        cantidadMenorOIgual10k++;
        montoMenorOIgual10k += venta;
      } else if (venta > 10000 && venta < 20000) {
        cantidadEntre10kY20k++;
        montoEntre10kY20k += venta;
      }
      montoGlobal += venta;
    }

    _reporte = ReporteVentas(
      cantidadVentasMenorOIgual10k: cantidadMenorOIgual10k,
      montoVentasMenorOIgual10k: montoMenorOIgual10k,
      cantidadVentasEntre10kY20k: cantidadEntre10kY20k,
      montoVentasEntre10kY20k: montoEntre10kY20k,
      montoGlobal: montoGlobal,
    );
  }

  void limpiarVentas() {
    _ventas.clear();
    _reporte = ReporteVentas();
  }
}
