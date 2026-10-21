import pizza.*
import sistema.*

class Usuario{
    const pizzasFav = []
    const nombre // se va a tener que definicializar obligatoriamente 
    var crazyPizzaPoints = 0
    const premios = []
    const metodoDePago

    method agregarPizza(pizza){
        pizzasFav.add(pizza)
    }

    method tieneFavorita(pizza)= pizzasFav.contains(pizza)

    method comprarPizza(pizza){
        if (!sistema.esUsuario(self)) {
            throw new DomainException(message = "No eres usurio, registrate para comprar")
            }
        metodoDePago.pagar(pizza)
        crazyPizzaPoints += pizza.precio().div(100)
        sistema.comproPizza(pizza)
    }

    method sumarPuntos(numero){
        crazyPizzaPoints += numero
    }

    method pizzaFicionado()= crazyPizzaPoints > 1000

    method premio(){
        premios.add(new Premio(ganador = self, anio = new Date().year()))
    }

    method clasico()= premios.any({premio => premio.viejo()})
}

object tarjetaDeCredito{
    const limite = 22000
    var deuda = 0

    method pagar(pizza){
        if (pizza.precio() > limite){ throw new DomainException (message = "Limite alcanzado. Transacción cancelada.")}
        deuda += pizza.precio()
    }

}

object tarjetaDeDebito{
    const saldo = 23000

    method pagar(pizza){
        if (pizza.precio() > saldo) {throw new DomainException (message = "Saldo insuficiente. Transacción cancelada.")}
    }
}

object pDePay{
    method pagar(pizza){}
}