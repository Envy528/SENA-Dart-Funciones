int calcularPorcentajeDescuento({
  required int subtotal,
  String? cupon,
  bool clienteFrecuente = false,
  int maximo = 20,
}) {
  int porcentaje = 0;
  if (subtotal >= 150000) {
    porcentaje += 10;
  }
  if (cupon != null) {
    switch (cupon.toLowerCase()) {
      case 'cumple':
        porcentaje += 15;
        break;
      case 'estudiante':
        porcentaje += 5;
        break;
      default:
        print('Cupón $cupon no válido');
    }
  }
  if (clienteFrecuente) {
    porcentaje += 5;
  }
  if (porcentaje > maximo) {
    porcentaje = maximo;
  }
  return porcentaje;
}

int aplicarDescuento(int subtotal, int porcentaje) {
  return subtotal - (subtotal * porcentaje ~/ 100);
}

void main() {
  List<int> subtotales = [162000, 162000, 80000, 80000];
  List<String?> cupones = ['CUMPLE', null, 'estudiante', 'GRATIS'];
  List<bool> frecuentes = [true, true, false, false];
  for (var i = 0; i < subtotales.length; i++) {
    int porcentaje = calcularPorcentajeDescuento(
      subtotal: subtotales[i],
      cupon: cupones[i],
      clienteFrecuente: frecuentes[i],
    );
    int total = aplicarDescuento(subtotales[i], porcentaje);
    print(
      'Caso ${i + 1}: subtotal ${subtotales[i]}, descuento $porcentaje %, total $total',
    );
  }
}
