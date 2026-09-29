import jeanGray.*
import neo.*
import saraConnor.*
import destinos.*

object paquete {
  var property destino = matrix
  var property pago = false

  method precio() {
    return destino.costoEnvio() + 50
  }
  method estaPago() {
    return pago
  }
  method esPosibleEntrega_(repartidor) {
    return self.estaPago() && destino.puedePasar_(repartidor)
  }
}
object paquetito {
  var property destino = matrix

  method precio() {
    return 0
  }
  method estaPago() {
    return true
  }
  method esPosibleEntrega_(repartidor) {
    return self.estaPago() && destino.puedePasar_(repartidor)
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
    return self.estaPago() && listDestinos.all{destino => destino.puedePasar_(repartidor)}
  }
  method sumarDestino(destino) = listDestinos.add(destino)
}
object caja {
  var property destino = nuncaJamas
  var property pesoPaquete = 0
  const pagosHechos = []

  method sumarPago_(pago) = pagosHechos.add(pago)

  method precio() {
    return destino.costoEnvio() + 10 * pesoPaquete
  }
  method cantFaltaPagar() { 
    return self.precio() - pagosHechos.sum()
  }
  method estaPago() {
    return self.cantFaltaPagar() == 0
  }
  method esPosibleEntrega_(repartidor) {
    return self.estaPago() && destino.puedePasar_(repartidor)
  }
}