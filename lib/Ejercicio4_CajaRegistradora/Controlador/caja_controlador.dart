import '../Modelo/dinero_modelo.dart';

import '../Modelo/dinero_modelo.dart';

class CajaRegistradoraController {
  // Recibe los valores como int y devuelve solo el total
  double calcularTotal({
    required int billeteCien,
    required int billeteCincuenta,
    required int billeteVeinte,
    required int billeteDiez,
    required int billeteCinco,
    required int billeteUno,
    required int monedaDolar,
    required int monedaCincuenta,
    required int monedaVeinticinco,
    required int monedaDiez,
    required int monedaCinco,
    required int monedaCentavo,
  }) {
    final dinero = Dinero(
      billeteCien: billeteCien,
      billeteCincuenta: billeteCincuenta,
      billeteVeinte: billeteVeinte,
      billeteDiez: billeteDiez,
      billeteCinco: billeteCinco,
      billeteUno: billeteUno,
      monedaDolar: monedaDolar,
      monedaCincuenta: monedaCincuenta,
      monedaVeinticinco: monedaVeinticinco,
      monedaDiez: monedaDiez,
      monedaCinco: monedaCinco,
      monedaCentavo: monedaCentavo,
    );

    return dinero.totalCajaRegistradora();
  }
}


