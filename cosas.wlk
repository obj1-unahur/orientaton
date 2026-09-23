object desaprobado {
  var property position = game.at(11, 6)

  method image() = "reprobado.png"

  method chocar(alguien) {
    // ============ MISIÓN 4: ¿qué pasa cuando te agarra un parcial? ============
    // Cada línea es una opción. Las que empiezan con // están APAGADAS (fijate que estan en gris)
    // Para prender una, borrale las dos barras //. Para apagarla, volvé a ponerlas.
    // ¡Podés prender varias a la vez!
    // >>> Después apretá Ctrl + Shift + B para volver a jugar y ver el cambio <<<

    alguien.volverAlInicio()                    // A: volvés a la entrada
    //alguien.perderUnaMateria()                // B: perdés una materia
    //position = tablero.lugarAlAzar()          // C: el parcial se teletransporta
    //game.say(self, "¡Sorpresa! ¡Parcial!")    // D: el parcial te habla

    // ==========================================================================
  }

  // ---- De acá para abajo no hace falta tocar nada ----
  method perseguir(alguien) {
    const destino = alguien.position()
    if (destino.x() > position.x()) {
      position = position.right(1)
    } else if (destino.x() < position.x()) {
      position = position.left(1)
    } else if (destino.y() > position.y()) {
      position = position.up(1)
    } else if (destino.y() < position.y()) {
      position = position.down(1)
    }
  }
}

object parcial{
  var property position = game.at(6,4)
  method image() = "parcial.png"

  method chocar(alumno){
    alumno.aprobar()
    if (alumno.recibido())
        game.removeVisual(self)
    else
        position = tablero.lugarAlAzar()
  }

}
object tablero {
  method ancho() = 13
  method alto() = 9

  // Cualquier casillero, menos la fila de arriba (ahí van los carteles)
  method lugarAlAzar() = game.at(
    0.randomUpTo(self.ancho()).truncate(0),
    0.randomUpTo(self.alto() - 1).truncate(0)
  )
}