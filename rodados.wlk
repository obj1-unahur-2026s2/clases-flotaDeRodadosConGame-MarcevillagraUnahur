import wollok.game.*
import colores.*
import game_elementos.*

class ChevroletCorsa {
  var property color
  var position = game.at(0, 0)
  const posicionesVisitadas = []
  var ultimaDireccion = null
  var posicionAnterior = game.at(0, 0)
  
  method capacidad() = 4
  
  method velocidadMaxima() = 150
  
  method peso() = 1300
  
  method image() = color.image()
  
  method position() = position
  
  method position(nuevaPosicion) {
    posicionAnterior = position
    position = nuevaPosicion
    posicionesVisitadas.add(nuevaPosicion)
  }
  
  method deshacerMovimiento() {
    position = posicionAnterior
    if (!posicionesVisitadas.isEmpty()) posicionesVisitadas.remove(
        posicionesVisitadas.last()
      )
  }
  
  method pasoPor(posicionBuscada) = posicionesVisitadas.contains(
    posicionBuscada
  )
  
  method pasoPorFila(numero) = posicionesVisitadas.any({ p => p.x() == numero })
  
  method recorrioFilas(lista) = lista.all({ n => self.pasoPorFila(n) })
  
  method moverseHacia(direccion) {
    ultimaDireccion = direccion
    const nuevaPosicion = direccion.siguiente(position)
    if (self.esPosicionValida(nuevaPosicion)) self.position(nuevaPosicion)
  }
  
  method esPosicionValida(pos) = pos.x().between(
    0,
    game.width() - 1
  ) && pos.y().between(0, game.height() - 1)
  
  method repetirUltimoMovimiento() {
    if (ultimaDireccion != null) self.moverseHacia(ultimaDireccion)
  }
  
  method estaEn(region) = region.contiene(position)
}

class RenaultKwid {
  var equipoDeGas = sinAdicional
  
  method color() = azul
  
  method colocarTanque() {
    equipoDeGas = conAdicional
  }
  
  method capacidad() = equipoDeGas.capacidad()
  
  method sacarTanque() {
    equipoDeGas = sinAdicional
  }
  
  method velocidadMaxima() = equipoDeGas.velocidadMaxima()
  
  method peso() = equipoDeGas.peso() + 1200
}

class AutoEspecial {
  const capacidad
  const velocidadMaxima
  const peso
  const color
  
  method capacidad() = capacidad
  
  method velocidadMaxima() = velocidadMaxima
  
  method peso() = peso
  
  method color() = color
}

object trafic {
  var property interior = interiorPopular
  var property motor = motorBataton
  
  method color() = blanco
  
  method capacidad() = interior.capacidad()
  
  method velocidadMaxima() = motor.velocidadMaxima()
  
  method peso() = (4000 + interior.peso()) + motor.peso()
  method cambiarInterior(unInterior) {interior=unInterior
    
  }
}

object interiorComodo {
  method capacidad() = 5
  
  method peso() = 700
}

object interiorPopular {
  method capacidad() = 12
  
  method peso() = 1000
}

object motorPulenta {
  method velocidadMaxima() = 130
  
  method peso() = 800
}

object motorBataton {
  method velocidadMaxima() = 80
  
  method peso() = 500
}

object conAdicional {
  method capacidad() = 3
  
  method peso() = 150
  
  method velocidadMaxima() = 110
}

object sinAdicional {
  method capacidad() = 4
  
  method peso() = 0
  
  method velocidadMaxima() = 120
}