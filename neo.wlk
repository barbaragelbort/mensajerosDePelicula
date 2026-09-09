import paquete.*

object neo {
  var property credito = 10
  const destinoMatrix = matrix
  const destinoPuente = puenteBrooklyn

  method puedeIrA_(destino) {
    return (destino == destinoPuente) || (destino == destinoMatrix && credito > 0)
  }
}