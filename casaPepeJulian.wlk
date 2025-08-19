object casa{
    var viveres = 50
    var montoReparaciones  = 0
    const valorSuficiente = 40
    var cuenta = cuentaCorriente

    method tieneViveresSuficiente() {
        return viveres > valorSuficiente
    }

    method hayQueHacerReparaciones() {
        return montoReparaciones > 0
    }

    method estaEnOrden() { 
        return self.tieneViveresSuficiente() and not self.hayQueHacerReparaciones()
    }

    method viveres(){
        return viveres
    }

    method viveres(valor){
        viveres = valor
    }

    method montoReparaciones(cantidad) {
        montoReparaciones = cantidad
    }

    method comprarLoQueSeNecesita(calidad){
        self.gasto((valorSuficiente - self.viveres()) * calidad)
        self.viveres(valorSuficiente)
    }

    method gasto(valor){
        cuenta.extraer(valor)
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

        method extraer(monto) {
            if(primaria.saldo() >= monto){
            // primaria.saldo() = primaria.saldo() - monto // no se puede por encapsulamiento
                primaria.extraer(monto)
            }
            else secundaria.extraer(monto)
        }

        method saldo() {
            return primaria.saldo() + secundaria.saldo()
        
        }

}

object minimo {

    var calidad = 1

    method mantenimiento(){
        if(not casa.tieneViveresSuficiente()) {
            casa.comprarLoQueSeNecesita(calidad)
        }
    }
  
}