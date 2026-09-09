import paquete.*

object saraConnor {
  const destinoPuente = puenteBrooklyn
  var property vehiculo = moto
  var property pesoSara = 65

  method puedeIrA_(destino) {
    return destino == destinoPuente && vehiculo.peso() + pesoSara <= 1000
  }
}

object moto {
  method peso() {
    return 100
  }
}
object camion {
  var property cantAcoplados = 0

  method peso() {
    return 500 + 500 * cantAcoplados
  }
}