//Mensajeros

object roberto {
    var peso = 90
    var vehiculo = bicicleta
    var ubicacionDeEntrega = matrix
    var paquetePago = true

    method puedeEntregarPaquete(){
        return ubicacionDeEntrega.dejaEntrar(self) && paqueteEstaPago()
    } 

    method paqueteEstaPago() = paquetePago

    method peso() = peso + vehiculo.peso()

    method puedeLlamar() = false

    method cambiarPeso(unPeso){
        peso = unPeso
    }

    method cambiarVehiculo(unVehiculo){
    vehiculoo = unVehiculo
    }
    }

object chuckNorris {
    var ubicacionDeEntrega = matrix
    var paquetePago = true

    method puedeEntregarPaquete(){
        return ubicacionDeEntrega.dejaEntrar(self) && paqueteEstaPago()
    } 

    method paqueteEstaPago() = paquetePago
    
    method peso() = 80

    method puedeLlamar() = true
}

object neo {
    var credito = 15
    var ubicacionDeEntrega = matrix
    var paquetePago = true

    method puedeEntregarPaquete(){
        return ubicacionDeEntrega.dejaEntrar(self) && paqueteEstaPago()
    } 

    method paqueteEstaPago() = paquetePago
    
    method peso() = 0

    method puedeLlamar() = credito > 10

    method acreditarOConsumirCredito(unaCantidad){
        credito += unaCantidad
    }
}

//Vehiculos
object bicicleta {
    method peso() = 5
}

//Toneladas 1000KG.
object camion {
    var acoplados = 2
    method peso() = acoplados * 500
}



//Lugares

object puenteDeBroklyn {
    method dejaEntrar(unMensajero) = unMensajero.peso() <= 1000
}

object matrix {
    method dejaEntrar(unMensajero) = unMensajero.puedeLlamar()
}