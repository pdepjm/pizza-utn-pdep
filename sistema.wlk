import usuarios.*

object sistema{
    var usuarios=[]

    method registrarUsuario(nombre){
        usuarios.add(new Usuario(nombre=nombre))
    }

    method cuantosLesGusta(pizza){
        usuarios.count({usuario => usuario.tieneFavorita(pizza)})
    }

    method regalarCrazyPP(){
        usuarios.forEach({usuario => usuario.sumarPuntos(100)})
    }

    method nombresRegistrados()= usuarios.map({usuario =>usuario.nombre()})

    method premioPizzaFicionados()=self.pizzaFicionadoS().forEach({pizzaFicionadoS => pizzaFicionadoS.premio()})

    method pizzaFicionadoS()=usuarios.filter({usuario=> usuario.pizzaFicionado()})
}