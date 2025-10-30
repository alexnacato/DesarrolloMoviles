
class Escuela{

  final int totalSalones;
  //Lista q va guardar los valores promedio de cada salon
  List<double> promediosPorSalon;

  Escuela({required this.totalSalones})
      : promediosPorSalon = List.filled(totalSalones, 0.0);
//Reglas de negocio para hacer el calculo de mis promedios

//1. Función que guardara el valor del promedio de los salones
void guardarPromedio(int numeroSalon, double promedio){
  //Unicamente me ubico en la posicion inicial y voy reemplazando los valores que ya tenia previamente
  promediosPorSalon[numeroSalon - 1] = promedio;
  }
//2. Metodo para calcular el promedio de toda la escuela: sumar todos los promedios y dividirlo para el total de salones
  double promedioGeneral() {
    double suma = 0;
    for (int i = 0; i < totalSalones; i++) {
      suma += promediosPorSalon[i];
    }
    return totalSalones > 0 ? suma / totalSalones : 0.0;
  }

}
