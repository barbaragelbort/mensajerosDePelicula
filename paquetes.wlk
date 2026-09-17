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
object paquetito {
  method precio() {
    return 0
  }
  method estaPago() {
    return true
  }
  method esPosibleEntrega() {
    return true
  }
}
object paquetonViajero {
  var property repartidor = neo //cambiarlo para pasarlo por parametro en esPosibleEntrega()

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
  method esPosibleEntrega() {
    return self.estaPago() && listDestinos.any{destino => destino.puedePasar_(repartidor)}
  }
  
}