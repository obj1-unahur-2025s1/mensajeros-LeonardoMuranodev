object empresa {
    const mensajeros = [roberto, chuckNorris, neo]

    //Metodos de consulta
    method mensajeros() = mensajeros

    method mensajeriaEsGrande() = mensajeros.size() > 2

    method primeroPuedeEntregarPaquete() = mensajeros.first().puedeEntregarPaquete()

    method pesoUltimoMensajero() = mensajeros.last().peso()

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
}

//Paquetes
object paquetito {
    method estaPago() = true
}

object paquetonViajero {
    const destinos = []
    var monto = 0

    method estaPago() = monto >= 100 * destinos.size()

    method pagar(unValor){
        monto += unValor
    }
}

object paqueteOriginal {
    var monto = 0
    
    method estaPago() = monto >= 50

    method pagarPaqueteOriginal(){
        monto = 50
    }
}

//Mensajeros
object roberto {
    //variables
    var peso = 80
    var vehiculo = bicicleta
    var ubicacionDeEntrega = matrix
    var paquete = paquetito

    //Metodos de consulta
    method puedeEntregarPaquete(){
        return ubicacionDeEntrega.dejaEntrar(self) && paquete.estaPago()
    } 

    method peso() = peso + vehiculo.peso()

    method puedeLlamar() = false

    //Metodos de indicacion
    method cambiarPeso(unPeso){
        peso = unPeso
    }

    method cambiarVehiculo(unVehiculo){
        vehiculo = unVehiculo
    }

    method cambiarPaquete(unPaquete){
        paquete = unPaquete 
    }

    method cambiarUbicacionDeEntrega(unLugar){
        ubicacionDeEntrega = unLugar
    }
}

object chuckNorris {
    //variables
    var ubicacionDeEntrega = matrix
    var paquete = paquetito

    //Metodos de consulta
    method puedeEntregarPaquete(){
        return ubicacionDeEntrega.dejaEntrar(self) && paquete.estaPago()
    } 
    
    method peso() = 80

    method puedeLlamar() = true

    //Metodos de indicacion
    method cambiarPaquete(unPaquete){
        paquete =  unPaquete
    }

    method cambiarUbicacionDeEntrega(unLugar){
        ubicacionDeEntrega = unLugar
    }
}

object neo {
    //variables
    var credito = 15
    var ubicacionDeEntrega = matrix
    var paquete = paquetito

    //Metodos de consulta
    method puedeEntregarPaquete(){
        return ubicacionDeEntrega.dejaEntrar(self) && paquete.estaPago()
    } 
    
    method peso() = 0

    method puedeLlamar() = credito > 10

    //Metodos de indicacion
    method acreditarOConsumirCredito(unaCantidad){
        credito += unaCantidad
    }

    method cambiarPaquete(unPaquete){
        paquete =  unPaquete
    }

    method cambiarUbicacionDeEntrega(unLugar){
        ubicacionDeEntrega = unLugar
    }
}

object thiaguillo {

}

//Vehiculos
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

//Lugares

object puenteDeBroklyn {
    method dejaEntrar(unMensajero) = unMensajero.peso() <= 1000
}

object matrix {
    method dejaEntrar(unMensajero) = unMensajero.puedeLlamar()
}