class ReporteVentas {
  final int cantidadVentasMenorOIgual10k;
  final double montoVentasMenorOIgual10k;
  final int cantidadVentasEntre10kY20k;
  final double montoVentasEntre10kY20k;
  final double montoGlobal;

  ReporteVentas({
    this.cantidadVentasMenorOIgual10k = 0,
    this.montoVentasMenorOIgual10k = 0.0,
    this.cantidadVentasEntre10kY20k = 0,
    this.montoVentasEntre10kY20k = 0.0,
    this.montoGlobal = 0.0,
  });
}
