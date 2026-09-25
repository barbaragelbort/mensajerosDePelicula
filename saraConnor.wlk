import paquetes.*
import destinos.*

object saraConnor {
  var property vehiculo = moto
  var property pesoSara = 65
  const edad = 35

  method peso() {
    return pesoSara + vehiculo.peso()
  }
  method puedeLlamar() {
    return false
  }
  method tienePolvosMagicos() {
    return edad < 12
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