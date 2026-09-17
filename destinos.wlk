import jeanGray.*
import neo.*
import saraConnor.*
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