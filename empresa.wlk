import paquetes.*
import jeanGray.*
import saraConnor.*
import neo.*

object empresaDeMensajeria {
    var facturacion = 0
    const conjRepartidores = #{}
    const conjPaquetesEspera = #{}

    method hayPaquetesEnEspera() {
      return not conjPaquetesEspera.isEmpty()
    }

    method facturacion() { return facturacion }

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

    method puedeSerEntregadoPorPrimRepartidor(unPaquete) {
      return paquete.esPosibleEntrega_(unPaquete)
    }
    method pesoDeUltimoRepartidor() {
      return conjRepartidores.anyOne().peso()
    }

    method puede_SerEntregadoPorAlgunRepartidor(unPaquete) {
      return conjRepartidores.asList().any{repartidor => unPaquete.esPosibleEntrega_(repartidor)}
    }
    method repartidoresQuePuedenEnviar_(unPaquete) {
      return conjRepartidores.filter{repartidor => unPaquete.esPosibleEntrega_(repartidor)}
    }
    method esEmpresaConSobrepeso() {
      return conjRepartidores.asList().average{repartidor => repartidor.peso()} > 500
    }
    method enviarPaquete_(unPaquete) {
      if (self.puede_SerEntregadoPorAlgunRepartidor(paquete)) 
        {facturacion += unPaquete.precio()}
        else {conjPaquetesEspera.add(unPaquete)}
    }
    method enviarTodosLosPaquetesDe_(conjPaquetes) {
      conjPaquetes.forEach{paquete => self.enviarPaquete_(paquete)}
    }
    method enviarElMasCaroEnEspera() {
      if (self.puede_SerEntregadoPorAlgunRepartidor(conjPaquetesEspera.máx{ paquete => paquete.precio() }))
        { self.enviarPaquete_(conjPaquetesEspera.máx {paquete => paquete.precio()})}
    }
}