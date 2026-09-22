object alumno {
  var materias = 0
  var property recibido = false
  var property position = game.at(1,1)

  // ================= MISIÓN 1: cambiale la ropa =================
  // Colores que hay: rojo, azul, verde, violeta, amarillo
  // Cambiá la palabra "rojo" por otro color. ¡Dejá las comillas!
  method image() = "estudiante_rojo.png"
  // >>> Después anda a "miJuego.wpg," y apretá "Run programa". Volvé al juego y presiona Actualizar para seguir jugando <<<
  // ==============================================================


  // ================= MISIÓN 2: ¿qué dice tu personaje? ==========
  // Escribí lo que quieras entre las comillas.
  // En el juego, apretá la tecla h para escucharlo.
  method saludo() = "Hola"
  // >>> Después anda a "miJuego.wpg," y apretá "Run programa". Volvé al juego y presiona Actualizar para seguir jugando <<<
  // ==============================================================


  // ================= MISIÓN 3: ¿cuántas materias para recibirte? =
  // Cambiá el número. ¿Qué pasa si ponés 1? ¿Y 100?
  method materiasParaRecibirse() = 5
  // >>> Después anda a "miJuego.wpg," y apretá "Run programa". Volvé al juego y presiona Actualizar para seguir jugando <<<
  // ==============================================================


// ---- De acá para abajo no hace falta tocar nada ----

  method materias() = materias

  method saludar() {
    game.say(self, self.saludo())
  }

  method aprobar() {
    materias = materias + 1
    if (!recibido and materias >= self.materiasParaRecibirse()) {
      self.recibirse()
    }
  }

  method recibirse() {
    recibido = true
    game.say(self, "¡ME RECIBÍ!")
    game.removeTickEvent("2 se mueve")
  }

  method volverAlInicio() {
    position = game.at(1, 1)
  }

  method perderUnaMateria() {
    materias = (materias - 1).max(0)
  }

 
}

