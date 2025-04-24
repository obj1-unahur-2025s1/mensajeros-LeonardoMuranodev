//Mensajeros
object roberto {
    //variables
    var peso = 80
    var vehiculo = bicicleta
    var ubicacionDeEntrega = matrix
    var paquetePago = true

    //Metodos de consulta
    method puedeEntregarPaquete(){
        return ubicacionDeEntrega.dejaEntrar(self) && self.paqueteEstaPago()
    } 

    method paqueteEstaPago() = paquetePago

    method peso() = peso + vehiculo.peso()

    method puedeLlamar() = false

    //Metodos de indicacion
    method cambiarPeso(unPeso){
        peso = unPeso
    }

    method cambiarVehiculo(unVehiculo){
        vehiculo = unVehiculo
    }

    method cambiarEstadoPaquete(unValor){
        paquetePago = unValor 
    }

    method cambiarUbicacionDeEntrega(unLugar){
        ubicacionDeEntrega = unLugar
    }
}

object chuckNorris {
    //variables
    var ubicacionDeEntrega = matrix
    var paquetePago = true

    //Metodos de consulta
    method puedeEntregarPaquete(){
        return ubicacionDeEntrega.dejaEntrar(self) && self.paqueteEstaPago()
    } 

    method paqueteEstaPago() = paquetePago
    
    method peso() = 80

    method puedeLlamar() = true

    //Metodos de indicacion
    method cambiarEstadoPaquete(unValor){
        paquetePago = unValor 
    }

    method cambiarUbicacionDeEntrega(unLugar){
        ubicacionDeEntrega = unLugar
    }
}

object neo {
    //variables
    var credito = 15
    var ubicacionDeEntrega = matrix
    var paquetePago = true

    //Metodos de consulta
    method puedeEntregarPaquete(){
        return ubicacionDeEntrega.dejaEntrar(self) && self.paqueteEstaPago()
    } 

    method paqueteEstaPago() = paquetePago
    
    method peso() = 0

    method puedeLlamar() = credito > 10

    //Metodos de indicacion
    method acreditarOConsumirCredito(unaCantidad){
        credito += unaCantidad
    }

    method cambiarEstadoPaquete(unValor){
        paquetePago = unValor 
    }

    method cambiarUbicacionDeEntrega(unLugar){
        ubicacionDeEntrega = unLugar
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