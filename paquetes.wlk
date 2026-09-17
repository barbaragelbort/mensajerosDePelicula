import jeanGray.*
import neo.*
import saraConnor.*
import destinos.*

object paquete {
  var property destino = matrix
  var property pago = false

  method precio() {
    return destino.costoEnvio()
  }
  method estaPago() {
    return pago
  }
  method esPosibleEntrega_(repartidor) {
    return self.estaPago() && destino.puedePasar_(repartidor)
  }
}
object paquetito {
  method precio() {
    return 0
  }
  method estaPago() {
    return true
  }
  method esPosibleEntrega_(repatidor) {
    return true
  }
}
object paquetonViajero {
  const listDestinos = []
  const pagosHechos = []

  method precio() {
    return listDestinos.sum{destino => destino.costoEnvio()} + 100 * listDestinos.size()
  }
  method cantFaltaPagar() { 
    return self.precio() - pagosHechos.sum()
  }
  method sumarPago_(pago) = pagosHechos.add(pago)

  method estaPago() {
    return self.cantFaltaPagar() == 0 
  }
  method esPosibleEntrega_(repartidor) {
    return self.estaPago() && listDestinos.any{destino => destino.puedePasar_(repartidor)}
  }
  
}