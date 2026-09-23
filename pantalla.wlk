import wollok.game.*
import estudiante.*
import cosas.*

// Carteles que se ven en la fila de arriba. No hace falta tocar este archivo.

object marcador {
  method position() = game.at(1, tablero.alto() - 1)
 
  method text() = "Materias: " + alumno.materias().toString() + " / " + alumno.materiasParaRecibirse().toString()
  method textColor() = "FFFFFFFF"

  method chocasteA(alguien) {}
}


object cartelMision {
  method position() = game.at(7, tablero.alto() - 1)
  method text() = misiones.actual()
  method textColor() = "FFFF66FF"
  method chocasteA(alguien) {}
}

// El juego se da cuenta solo de qué misiones ya hiciste,
// mirando si cambiaste el código. Por eso hay que volver a correrlo.
object misiones {
  method actual() = self.mision() + "\n>>> Cuando la hagas presiona 'Run program' en miJuego.wpgm para volver a jugar <<<"

  method mision() =
    if (alumno.image() == "estudiante_rojo.png")
      "MISIÓN 1: cambiale la ropa a tu personaje\nAbrí estudiante.wlk y buscá MISIÓN 1"
    else if (alumno.dialogo() == "Hola")
      "¡Bien! MISIÓN 2: hacé que tu personaje diga otra cosa\nAbrí estudiante.wlk y buscá MISIÓN 2 (probalo con la H)"
    else if (alumno.materiasParaRecibirse() == 5)
      "¡Bien! MISIÓN 3: cambiá cuántas materias necesitás para recibirte\nAbrí estudiante.wlk y buscá MISIÓN 3"
    else
      "¡Bien! MISIÓN 4: ¿qué pasa cuando te agarra un alcanza el 2 ?\nAbrí cosas.wlk y buscá MISIÓN 4"
}