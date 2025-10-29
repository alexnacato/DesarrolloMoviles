import '../Model/compras_model.dart';


class FacturaController {
  Factura calcularFactura(String nombreCliente, String subtotalTexto) {
    //Validar que no esté vacío
    if (nombreCliente.isEmpty || subtotalTexto.isEmpty) {
      throw Exception('Debe llenar todos los campos.');
    }

    // Intentar convertir a número
    final subtotal = double.tryParse(subtotalTexto);
    if (subtotal == null) {
      throw Exception('Ingrese un valor numérico válido.');
    }

    // Calcular IVA, descuento, total y sueldo del vendedor
    double iva = subtotal * 0.15;
    double descuento = subtotal > 2000 ? subtotal * 0.20 : 0;
    double total = subtotal + iva - descuento;
    double sueldoVendedor = total * 0.10;

    // Crear y devolver la factura
    return Factura(
      cliente: nombreCliente,
      subtotal: subtotal,
      iva: iva,
      descuento: descuento,
      total: total,
      sueldoVendedor: sueldoVendedor,
    );
  }
}
