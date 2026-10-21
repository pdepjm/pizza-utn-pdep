import usuarios.*

object sistema{
    const usuarios=[]
    var ganancias= 0

    method registrarUsuario(nombre, metodoPago){
        usuarios.add(new Usuario(nombre=nombre, metodoDePago = metodoPago))
    }

    method esUsuario(usuario) = usuarios.contains(usuario)

    method cuantosLesGusta(pizza){
        usuarios.count({usuario => usuario.tieneFavorita(pizza)})
    }

    method regalarCrazyPP(){
        usuarios.forEach({usuario => usuario.sumarPuntos(100)})
    }

    method nombresRegistrados()= usuarios.map({usuario =>usuario.nombre()})

    method premioPizzaFicionados()=self.pizzaFicionadoS().forEach({pizzaFicionadoS => pizzaFicionadoS.premio()})

    method pizzaFicionadoS()=usuarios.filter({usuario=> usuario.pizzaFicionado()})

    method ganancias()= ganancias

    method comproPizza(pizza){
        ganancias += pizza.precio()
    }

}

class Premio {
    const ganador
    const anio

    method texto()= ganador.nombre() + "ganó el premio pizza loca en el año" + anio

    method viejo()= 2020 > anio
}