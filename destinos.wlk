import jeanGray.*
import neo.*
import saraConnor.*
import peterPan.*
import paquetes.*

object matrix {
  method costoEnvio() {
    return 500
  }
  method puedePasar_(repartidor) {
    return repartidor.puedeLlamar()
  }
}
object puenteBrooklyn {
  method costoEnvio() {
    return 150
  }
  method puedePasar_(repartidor) {
    return repartidor.peso() <= 1000
  }
}
object nuncaJamas {
  method costoEnvio() {
    return 250
  }
  method puedePasar_(repartidor) {
    return repartidor.tienePolvosMagicos()
  }
}