class Dinero{

  final int billeteCien;
  final int billeteCincuenta;
  final int billeteVeinte;
  final int billeteDiez;
  final int billeteCinco;
  final int billeteUno;

  final int monedaDolar;
  final int monedaCincuenta;
  final int monedaVeinticinco;
  final int monedaDiez;
  final int monedaCinco;
  final int monedaCentavo;

  Dinero({required this.billeteCien, required this.billeteCincuenta, required this.billeteVeinte, required this.billeteDiez,
  required this.billeteCinco, required this.billeteUno, required this.monedaDolar, required this.monedaCincuenta, required this.monedaVeinticinco,
    required this.monedaDiez, required this.monedaCinco, required this.monedaCentavo
  });

  double totalCajaRegistradora() {
    // Validamos que todos los valores sean mayores a 0
    if (billeteCien <= 0 ||
        billeteCincuenta <= 0 ||
        billeteVeinte <= 0 ||
        billeteDiez <= 0 ||
        billeteCinco <= 0 ||
        billeteUno <= 0 ||
        monedaDolar <= 0 ||
        monedaCincuenta <= 0 ||
        monedaVeinticinco <= 0 ||
        monedaDiez <= 0 ||
        monedaCinco <= 0 ||
        monedaCentavo <= 0) {
      return -1;
    }


    double totalCaja =
        (billeteCien * 100) +
            (billeteCincuenta * 50) +
            (billeteVeinte * 20) +
            (billeteDiez * 10) +
            (billeteCinco * 5) +
            (billeteUno * 1) +
            (monedaDolar * 1) +
            (monedaCincuenta * 0.50) +
            (monedaVeinticinco * 0.25) +
            (monedaDiez * 0.10) +
            (monedaCinco * 0.05) +
            (monedaCentavo * 0.01);

    return totalCaja;
  }



}