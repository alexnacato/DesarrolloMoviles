import '../Model/inversion_model.dart';

class InversionController {
  Inversion calcularInversion(double depositoMensual, int anios) {
    const interesAnual = 0.10;
    double total = 0;
    List<double> totales = [];

    for (int i = 1; i <= anios; i++) {
      total += depositoMensual * 12; 
      total += total * interesAnual; 
      totales.add(total);
    }

    return Inversion(
      depositoMensual: depositoMensual,
      anios: anios,
      interesAnual: interesAnual,
      totalesPorAnio: totales,
    );
  }
}
