import wollok.game.*

object norte {
  method siguiente(position) = position.up(1)
}

object sur {
  method siguiente(position) = position.down(1)
}

object este {
  method siguiente(position) = position.right(1)
}

object oeste {
  method siguiente(position) = position.left(1)
}

class Pared {
  var resistencia
  const position

  method resistencia() = resistencia
  method position() = position

  method image() {
    if (resistencia >= 3) return "paredLadrillos3.jpg"
    if (resistencia == 2) return "paredLadrillos2.jpg"
    return "paredLadrillos1.jpg"
  }

  method chocar(auto) {
    if (resistencia > 0) {
      resistencia -= 1
      auto.deshacerMovimiento()
    }
    if (resistencia == 0) {
      game.removeVisual(self)
    }
  }
}

class RegionRectangular {
  const xInicial
  const yInicial
  const xFinal
  const yFinal

  method xInicial() = xInicial
  method yInicial() = yInicial
  method xFinal() = xFinal
  method yFinal() = yFinal

  method contiene(position) =
       position.x() >= xInicial && position.x() <= xFinal
    && position.y() >= yInicial && position.y() <= yFinal

  method interseccion(otraRegion) {
    return new RegionRectangular(
      xInicial = self.xInicial().max(otraRegion.xInicial()),
      xFinal   = self.xFinal().min(otraRegion.xFinal()),
      yInicial = self.yInicial().max(otraRegion.yInicial()),
      yFinal   = self.yFinal().min(otraRegion.yFinal())
    )
  }

  method union(otraRegion) = new RegionCompuesta(region1 = self, region2 = otraRegion)
}

class RegionCompuesta {
  const region1
  const region2

  method contiene(position) = region1.contiene(position) || region2.contiene(position)
}
