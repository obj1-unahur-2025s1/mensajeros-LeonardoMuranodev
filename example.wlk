object empresa {
    const mensajeros = [roberto, chuckNorris, neo]
    const paquetesPendientes = []
    const paquetesEnviados = []

    //Metodos de consulta: 2da parte: ok
    method getMensajeros() = mensajeros

    method mensajeriaEsGrande() = mensajeros.size() > 2

    method primeroPuedeEntregarPaquete(unPaquete) = unPaquete.puedeEntregarPaquete(mensajeros.first())

    method pesoUltimoMensajero() = mensajeros.last().peso()

    //Metodos de consulta: 3ra parte:ok

    method hayAlgunMensajeroQuePuedeEntregar(unPaquete){
        return mensajeros.any({e => unPaquete.puedeEntregarPaquete(e)})
    }

    method mensajerosQuePuedenEntregar(unPaquete){
        if(self.hayAlgunMensajeroQuePuedeEntregar(unPaquete)){
            return mensajeros.filter({e => unPaquete.puedeEntregarPaquete(e)})
        } else{
            return []
        }
    } 

    method haySobrepeso() = mensajeros.sum({e => e.peso()}) / mensajeros.size() >= 500

    method facturacion() = paquetesEnviados.sum({p => p.valorPaquete()})

    //metodos de indicacion
    method contratarMensajero(unMensajero){
        mensajeros.add(unMensajero)
    }

    method despedirMensajero(unMensajero){
        mensajeros.remove(unMensajero)
    }

    method despedirATodos(){
        mensajeros.clear()
    }

    //metodos de indicacion: 3ra parte
    method enviarUnPaquete(unPaquete){
        if(self.mensajerosQuePuedenEntregar(unPaquete).isEmpty()){
            paquetesPendientes.add(unPaquete)
        } else {
            paquetesEnviados.add(unPaquete)
        }
    }

    method enviarLosPaquetes(unaListaDePaquetes) {
        unaListaDePaquetes.forEach({e => self.enviarUnPaquete(e)})
    }

    method enviarPendienteMasCaro(){
        const elMasCaro = paquetesPendientes.max({e => e.valorPaquete()})
        if(self.hayAlgunMensajeroQuePuedeEntregar(elMasCaro)){
            self.enviarUnPaquete(elMasCaro)
            paquetesPendientes.remove(elMasCaro)
        }
    }
}

//Paquetes
object paquetito {
    var ubicacionDeEntrega = matrix

    //Metodos de consulta
    method puedeEntregarPaquete(unMensajero){
        return ubicacionDeEntrega.dejaEntrar(unMensajero) && self.estaPago()
    } 
    
    method estaPago() = true

    method valorPaquete() = 0

    //Metodos de indicacion
    method cambiarUbicacionDeEntrega(unLugar){
        ubicacionDeEntrega = unLugar
    }
}

object paquetonViajero {
    const destinos = []
    var montoPagado = 0

    //metodos de consulta
    method puedeEntregarPaquete(unMensajero){
        return destinos.all({e => e.dejaEntrar(unMensajero)}) && self.estaPago()
    }
    
    method estaPago() = montoPagado >= self.valorPaquete()

    method valorPaquete() = 100 * destinos.size()

    //metodos de indicacion
    method pagar(unValor){
        montoPagado += unValor
    }

    method agregarUbicacionDeEntrega(unLugar){
        destinos.add(unLugar)
    }

    method eliminarUbicacionDeEntrega(unLugar){
        destinos.remove(unLugar)
    }
}

object paqueteOriginal {
    var montoPagado = 0
    var ubicacionDeEntrega = matrix
    
    //metodos de consulta
    method puedeEntregarPaquete(unMensajero){
        return ubicacionDeEntrega.dejaEntrar(unMensajero) && self.estaPago()
    }
    
    method estaPago() = montoPagado >= self.valorPaquete()

    method valorPaquete() = 50

    //metodos de indicacion
    //Para mantener polimorfismo con el paqueton viajero
    method pagar(unValor){
        montoPagado = 50
    }

    method cambiarUbicacionDeEntrega(unLugar){
        ubicacionDeEntrega = unLugar
    }
}

object paqueteInvertido {
    var montoPagado = 0
    var ubicacionDeEntrega = matrix
    
    //metodos de consulta
    method puedeEntregarPaquete(unMensajero){
        return not (ubicacionDeEntrega.dejaEntrar(unMensajero) && self.estaPago())
    }
    
    method estaPago() = montoPagado >= self.valorPaquete()

    method valorPaquete() = 70

    //metodos de indicacion
    //Para mantener polimorfismo con el paqueton viajero
    method pagar(unValor){
        montoPagado = 70
    }

    method cambiarUbicacionDeEntrega(unLugar){
        ubicacionDeEntrega = unLugar
    }
}

//Mensajeros: ok
object roberto {
    //variables
    var peso = 80
    var vehiculo = bicicleta

    //Metodos de consulta
    method peso() = peso + vehiculo.peso()
    method puedeLlamar() = false

    //Metodos de indicacion
    method cambiarPeso(unPeso){
        peso = unPeso
    }

    method cambiarVehiculo(unVehiculo){
        vehiculo = unVehiculo
    }
}

object chuckNorris {
    //Metodos de consulta
    method peso() = 80
    method puedeLlamar() = true

    //Metodos de indicacion
}

object neo {
    //variables
    var tieneCredito = true

    //Metodos de consulta
    method peso() = 0
    method puedeLlamar() = tieneCredito

    //Metodos de indicacion

    method acreditarOConsumirCredito(){
        tieneCredito = !tieneCredito
    }
}

object kratos {
    //variables
    var peso = 15

    //Metodos de consulta
    method peso() = peso
    method puedeLlamar() = peso < 100

    //Metodos de indicacion

    method cambiarPeso(unPeso){
        peso = unPeso
    }
}

//Vehiculos: ok 
object bicicleta {
    method peso() = 5
}

//Toneladas 1000KG.
object camion {
    var acoplados = 2

    method peso() = acoplados * 500

    method cambiarAcoplados(unValor){
        acoplados = unValor
    }
}

//Lugares: ok
object puenteDeBroklyn {
    method dejaEntrar(unMensajero) = unMensajero.peso() <= 1000
}

object matrix {
    method dejaEntrar(unMensajero) = unMensajero.puedeLlamar()
}
