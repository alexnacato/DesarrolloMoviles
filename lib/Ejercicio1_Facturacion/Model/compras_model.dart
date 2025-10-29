class Factura{
  final String cliente;
  final double subtotal;
  final double iva;
  final double descuento;
  final double total;
  final double sueldoVendedor;

  Factura({
    required this.cliente,
    required this.subtotal,
    required this.iva,
    required this.descuento,
    required this.total,
    required this.sueldoVendedor,
  });

  
}