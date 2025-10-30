class Salon {
  static const int numeroSalon = 8;
  List<double> edadesAlumnos;

  Salon() : edadesAlumnos = List.filled(numeroSalon, 0.0);

  double calcularPromedioPorSalon() {
    double suma = 0;
    int contador = 0;

    for (var edad in edadesAlumnos) {
      if (edad > 0) { // solo cuenta edades válidas
        suma += edad;
        contador++;
      }
    }

    return contador > 0 ? suma / contador : 0.0;
  }
}
