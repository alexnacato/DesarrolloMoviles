import '../Modelo/escuela_model.dart';
import '../Modelo/salon_model.dart';


class EscuelaController {
  final Escuela escuela;

  EscuelaController({required this.escuela});

  /// Registra las edades del salón desde la vista
  void registrarEdades(int numeroSalon, List<String> edadesStr) {
    List<double> edades = edadesStr.map((e) => double.tryParse(e) ?? 0.0).toList();
    final salon = Salon();
    for (int i = 0; i < edades.length && i < Salon.numeroSalon; i++) {
      salon.edadesAlumnos[i] = edades[i];
    }

    double promedio = salon.calcularPromedioPorSalon();
    escuela.guardarPromedio(numeroSalon, promedio);
  }

  /// Devuelve promedio de un salón
  double obtenerPromedioSalon(int numeroSalon) {
    return escuela.promediosPorSalon[numeroSalon - 1];
  }

  /// Devuelve promedio general de la escuela
  double obtenerPromedioGeneral() {
    return escuela.promedioGeneral();
  }
}
