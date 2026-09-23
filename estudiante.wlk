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
  var dialogo = "Hola"
  // >>> Después anda a "miJuego.wpg," y apretá "Run programa". Volvé al juego y presiona Actualizar para seguir jugando <<<
  // ==============================================================


  // ================= MISIÓN 3: ¿cuántas materias para recibirte? =
  // Cambiá el número. ¿Qué pasa si ponés 1? ¿Y 100?
  method materiasParaRecibirse() = 5
  // >>> Después anda a "miJuego.wpg," y apretá "Run programa". Volvé al juego y presiona Actualizar para seguir jugando <<<
  // ==============================================================


// ---- De acá para abajo no hace falta tocar nada ----

  method materias() = materias

  method dialogo() = dialogo
  
  //metodo que se ejecuta cuando se apreta h
  method saludar() {
    saludo.aparecer()    
  }

  method aprobar() {
    materias = materias + 1
    if (!recibido and materias >= self.materiasParaRecibirse()) {
      self.recibirse()
    }
  }

  method recibirse() {
    recibido = true
    dialogo="¡ME RECIBÍ!"
    saludo.aparecer()
    game.removeTickEvent("2 se mueve")
  }

  method volverAlInicio() {
    position = game.at(1, 1)
  }

  method perderUnaMateria() {
    materias = (materias - 1).max(0)
  }

  method moverAbajo(){
    position = self.position().down(1)
  }
 
}

object saludo{
  var property position = game.origin()

  method image() = "saludo.png"

  method text() = alumno.dialogo()

  method aparecer(){
    position = game.at(alumno.position().x()+1, alumno.position().y()+1)
    game.addVisual(self)
    game.schedule(1000, { game.removeVisual(self) })
  }
}