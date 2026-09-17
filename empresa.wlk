import paquete.*
import jeanGray.*
import saraConnor.*
import neo.*

object empresaDeMensajeria {
    const conjRepartidores = #{}
    const conjPaquetesEspera = #{}

    method esRepartidorDeEmpresa_(repartidor) {
      return conjRepartidores.contains(repartidor)
    }

    method contratarRepartidor_(repartidor) {
        return conjRepartidores.add(repartidor) }

    method despedirRepartidor_(repartidor) = conjRepartidores.remove(repartidor)
    
    method despedirRepartidores() = conjRepartidores.clear()

    method cantRepartidores() {
      return conjRepartidores.size()
    }

    method esMensajeriaGrande() {
      return self.cantRepartidores() > 2
    }

    method puedeSerEntregadoPorPrimRepartidor(paquete) {
      paquete.repartidor(conjRepartidores.anyOne())
      return conjPaquetesEspera.anyOne().esPosibleEntrega()
    }

    method ingresarPaquete_(paquete) {
      conjPaquetesEspera.add(paquete)
    }

    method pesoDeUltimoRepartidor() {
      return conjRepartidores.anyOne().peso()
    }
}