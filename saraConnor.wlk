import paquete.*
import destinos.*

object saraConnor {
  var property vehiculo = moto
  var property pesoSara = 65

  method peso() {
    return pesoSara + vehiculo.peso()
  }
  method puedeLlamar() {
    return false
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