import jeanGray.*
import neo.*
import saraConnor.*
import destinos.*

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
    return self.estaPago() && destino.puedePasar_(repartidor)
  }
}