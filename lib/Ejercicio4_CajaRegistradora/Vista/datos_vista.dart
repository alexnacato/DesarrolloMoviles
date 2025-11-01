import 'package:flutter/material.dart';
import '../Controlador/caja_controlador.dart';
import '../Widget/btn_calcular.dart';
import '../Widget/inputs_cantidades.dart';

class datosVista extends StatefulWidget{
  @override
  State<datosVista> createState() => _datosLogica();
}

class _datosLogica extends State<datosVista>{
  //Instamcair mi objeto de tipo controller para usarlo
  final dineroController = CajaRegistradoraController();

  final cienCrt = TextEditingController();
  final cincuentaCrt = TextEditingController();
  final veinteCrt = TextEditingController();
  final diezCrt = TextEditingController();
  final cincoCrt = TextEditingController();
  final unoCrt = TextEditingController();
  final dolarCrt = TextEditingController();
  final monedaCincuentaCrt = TextEditingController();
  final monedaVeinticincoCrt = TextEditingController();
  final monedaDiezCrt = TextEditingController();
  final monedaCincoCrt = TextEditingController();
  final monedaUnoCrt = TextEditingController();

//Crear la funcion que hara la parte de calcular lo del model
  void _calcularCaja() {
    final total = dineroController.calcularTotal(
      billeteCien: int.tryParse(cienCrt.text) ?? -1,
      billeteCincuenta: int.tryParse(cincuentaCrt.text) ?? -1,
      billeteVeinte: int.tryParse(veinteCrt.text) ?? -1,
      billeteDiez: int.tryParse(diezCrt.text) ?? -1,
      billeteCinco: int.tryParse(cincoCrt.text) ?? -1,
      billeteUno: int.tryParse(unoCrt.text) ?? -1,
      monedaDolar: int.tryParse(dolarCrt.text) ?? -1,
      monedaCincuenta: int.tryParse(monedaCincuentaCrt.text) ?? -1,
      monedaVeinticinco: int.tryParse(monedaVeinticincoCrt.text) ?? -1,
      monedaDiez: int.tryParse(monedaDiezCrt.text) ?? -1,
      monedaCinco: int.tryParse(monedaCincoCrt.text) ?? -1,
      monedaCentavo: int.tryParse(monedaUnoCrt.text) ?? -1,
    );

    if (total == -1) {
      // Mostrar mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Valores inválidos"),
          backgroundColor: Colors.red,
        ),
      );
      return; // No continúa con el Navigator
    }

    
    Navigator.pushNamed(
      context,
      '/cajaRegistradoResultado',
      arguments: total,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuenta Caja Registradora"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            camposCantidades(controller: cienCrt,label: "Total Billetes de 100"),
            SizedBox(height: 20),
            camposCantidades(controller: cincuentaCrt,label: "Total Billetes de 50"),
            SizedBox(height: 20),
            camposCantidades(controller: veinteCrt,label: "Total Billetes de 20"),
            SizedBox(height: 20),
            camposCantidades(controller: diezCrt,label: "Total Billetes de 10"),
            SizedBox(height: 20),
            camposCantidades(controller: cincoCrt,label: "Total Billetes de 5"),
            SizedBox(height: 20),
            camposCantidades(controller: unoCrt,label: "Total Billetes de 1"),
            SizedBox(height: 20),
            camposCantidades(controller: monedaUnoCrt,label: "Total Monedas de 1 dolar"),
            SizedBox(height: 20),
            camposCantidades(controller: monedaCincuentaCrt,label: "Total Monedas de 50 centavo"),
            SizedBox(height: 20),
            camposCantidades(controller: monedaVeinticincoCrt,label: "Total Monedas de 25 centavo"),
            SizedBox(height: 20),
            camposCantidades(controller: monedaDiezCrt,label: "Total Monedas de 10 centavo"),
            SizedBox(height: 20),
            camposCantidades(controller: monedaCincoCrt,label: "Total Monedas de 5 centavo"),
            SizedBox(height: 20),
            camposCantidades(controller: monedaUnoCrt,label: "Total Monedas de 1 centavo"),
            SizedBox(height: 20),
            btnCalcular(funcion: _calcularCaja ,label: "Total de Dinero"),
          ],
        ),
      ),
    );
  }


}