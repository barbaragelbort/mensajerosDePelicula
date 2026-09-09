import jeanGray.*
import neo.*
object paquete {
  var property destino = matrix
  var property pago = false
  var property repartidor = neo

  method precio() {
    return destino.costoEnvio()
  }
  method estaPago() {
    return pago
  }
  method esPosibleEntrega() {
    return self.estaPago() && repartidor.puedeIrA_(destino)
  }
}

object matrix {
  method costoEnvio() {
    return 500
  }
}

object puenteBrooklyn {
  method costoEnvio() {
    return 150
  }
}