class Pedido {
  const distancia
  var tiempoMaximo
  const cantPasajeros
  const coloresIncompatibles = #{}

  method distancia() = distancia
  method tiempoMaximo() = tiempoMaximo
  method cantPasajeros() = cantPasajeros
  method coloresIncompatibles() = coloresIncompatibles

  method velocidadRequerida() = distancia / tiempoMaximo

  method puedeSerSatisfechoPor(auto) {
    return auto.velocidadMaxima() >= (self.velocidadRequerida() + 10)
        && auto.capacidad() >= cantPasajeros
        && !coloresIncompatibles.contains(auto.color())
  }

  method acelerar() {
    tiempoMaximo -= 1
  }

  method relajar() {
    tiempoMaximo += 1
  }
}
