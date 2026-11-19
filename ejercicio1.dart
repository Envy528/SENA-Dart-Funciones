int calcularPropina(int subtotal, {int porcentaje = 10}) {
  return (subtotal * porcentaje / 100).round();
}

int calcularTotal(int subtotal, {bool conPropina = true}) {
  if (conPropina) {
    return subtotal + calcularPropina(subtotal);
  } else {
    return subtotal;
  }
}

String formatearPesos(int valor) {
  String valorFormateado = valor.toString();
  String resultado = '';
  int contador = 0;

  for (int i = valorFormateado.length - 1; i >= 0; i--) {
    resultado = valorFormateado[i] + resultado;
    contador++;

    if (contador % 3 == 0 && i != 0) {
      resultado = '.' + resultado;
    }
  }

  return '\$ $resultado';
}

main() {
  int subtotal = 91000;
  print('Subtotal: ${formatearPesos(subtotal)}');
  print('Propina 10 %: ${formatearPesos(calcularPropina(subtotal))}');
  print(
    'Propina 15 %: ${formatearPesos(calcularPropina(subtotal, porcentaje: 15))}',
  );
  print('Total con propina: ${formatearPesos(calcularTotal(subtotal))}');
  print(
    'Total sin propina: ${formatearPesos(calcularTotal(subtotal, conPropina: false))}',
  );
  print(formatearPesos(999));
  print(formatearPesos(1000000));
}
