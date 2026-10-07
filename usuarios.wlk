import pizza.*
import sistema.*

class Usuario{
    var pizzasFav = []
    const nombre // se va a tener que definicializar obligatoriamente 
    var crazyPizzaPoints = 0
    var premios = []

    method agregarPizza(pizza){
        pizzasFav.add(pizza)
    }

    method tieneFavorita(pizza)= pizzasFav.contains(pizza)

    method comprarPizza(pizza){
        crazyPizzaPoints += pizza.precio().div(100)
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