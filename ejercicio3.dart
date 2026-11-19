final Map<String, int> menuDelDia = {
  'Ajiaco': 28000,
  'Bandeja paisa': 32000,
  'Sancocho': 26000,
  'Limonada': 6000,
  'Jugo natural': 7000,
  'Gaseosa': 5000,
  'Postre del día': 9000,
};

int calcularSubtotalPedido(Map<String, int> menu, Map<String, int> pedido) {
  int subtotal = 0;
  pedido.forEach((plato, cantidad) {
    if (menu.containsKey(plato)) {
      subtotal += menu[plato]! * cantidad;
    }
  });
  return subtotal;
}

List<String> productosNoEncontrados(
  Map<String, int> menu,
  Map<String, int> pedido,
) {
  List<String> noEncontrados = [];
  pedido.forEach((plato, cantidad) {
    if (!menu.containsKey(plato)) {
      noEncontrados.add(plato);
    }
  });
  return noEncontrados;
}

void imprimirComanda(int mesa, Map<String, int> menu, Map<String, int> pedido) {
  print('--- COMANDA MESA $mesa ---');
  pedido.forEach((plato, cantidad) {
    if (menu.containsKey(plato)) {
      int precio = menu[plato]!;
      print('$cantidad x $plato = ${precio * cantidad}');
    }
  });

  List<String> noEncontrados = productosNoEncontrados(menu, pedido);
  if (noEncontrados.isNotEmpty) {
    print('No están en el menú: $noEncontrados');
  }

  print('Subtotal: ${calcularSubtotalPedido(menu, pedido)};');
}

void main() {
  Map<String, int> pedidoMesa4 = {
    'Bandeja paisa': 2,
    'Limonada': 3,
    'Postre del día': 1,
    'Cazuela': 1,
  };
  imprimirComanda(4, menuDelDia, pedidoMesa4);
  Map<String, int> pedidoMesa9 = {'Ajiaco': 2, 'Gaseosa': 2};
  imprimirComanda(9, menuDelDia, pedidoMesa9);
}
