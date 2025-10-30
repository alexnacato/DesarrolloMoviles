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

  double totalCajaRegistradora(){
    //Primero debemos obtener los valores
    double totalCaja = (billeteCien*100)+(billeteCincuenta*50)+(billeteVeinte*20)+(billeteDiez*10)+(billeteCinco*5)
    + (billeteUno*1) + (monedaDolar*1)+(monedaCincuenta*0.50)+(monedaVeinticinco*0.25)+(monedaDiez*0.10)+(monedaCinco*0.05)+(monedaCentavo*0.01);
    return totalCaja;
  }


}