object casa{
    var viveres = 50
    var montoReparaciones  = 0

method tieneViveresSuficiente() {
    return viveres > 40
}

method hayQueHacerReparaciones() {
    return montoReparaciones > 0
}

method estaEnOrden() { 
    return self.tieneViveresSuficiente() and not self.hayQueHacerReparaciones()
}

method montoReparaciones(cantidad) {
  montoReparaciones = cantidad
}

}

//Cuentas
object cuentaCorriente {
    var saldo = 0

    method extraer(cantidad) {
        //saldo = saldo - cantidad
        saldo -= cantidad
    }

    method depositar(cantidad) {
        saldo += cantidad    
    }
  
}
object cuentaConGastos {
    var saldo = 0
    const costoOperacion = 20

    method extraer(cantidad) {
        saldo -= cantidad
    }

    method depositar(cantidad) {
        saldo += cantidad - costoOperacion  
    }

    method saldo(){
        return saldo 
    }
    
}    

object cuentaCombinada {
    var primaria = cuentaConGastos
    var secundaria = cuentaCorriente


method primaria(cuenta) { 
    primaria = cuenta
}

method primaria() {
    return primaria
  
}

method depositar(cantidad) {
         primaria.depositar(cantidad)
}

method saldo() {
    return primaria.saldo() + secundaria.saldo()
  
}

}