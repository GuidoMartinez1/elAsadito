import criterios.*
import elementos.*
import criterioAlimenticio.*


class Persona{
	var property posicion
	var property criterio
	const property elementosCercanos=[]
	var property criterioAlimenticio
	var property comidasQueIngerio = []
	
	method pedirElemento(elemento,emisor){
		self.validarSiTieneElemento(elemento,emisor)
		emisor.entregarSegunCriterio(emisor,elemento)
		self.recibirElemento(elemento)
	}
	
	method validarSiTieneElemento(elemento,otroComensal){
		if(!otroComensal.tieneElemento(elemento)){
			self.error("El comensal (posible emisor) no dispone del elemento pedido")
	}
	}
	method tieneElemento(elemento)=elementosCercanos.contains(elemento)
	
	method entregarSegunCriterio(emisor,elemento){
		emisor.criterio().entregarElemento(self,emisor,elemento)
	}
	method recibirElemento(elemento){
		elementosCercanos.add(elemento)
	}
	
	method aceptaComida(comida) {
		criterioAlimenticio.puedeComer(comida)
	}
	
	method estaPipon() = self.comidasQueIngerio().any({comida => comida.esPesada()})
	
	method laEstaPasandoBien()
	
}


object osky inherits Persona {
	
	override method laEstaPasandoBien() = true
}

object vero inherits Persona {
	
	override method laEstaPasandoBien() = self.elementosCercanos().size() <= 3
}

object facu inherits Persona {
	
	override method laEstaPasandoBien() = self.comidasQueIngerio().any({comida => comida.esCarne()})
}

object moni inherits Persona {
	
	override method laEstaPasandoBien() = self.posicion() == "1@1"
}

/*
 
Punto 5) En teoría... - 2 puntos

indicar un lugar donde utilizó
•polimorfismo

en la clase persona (la esta pasando bien)
* 
* porque muchos objetos entienden el mismo mensaje.

•herencia

en los criterios alimenticios y los de trafico de elementos
* 
* porque varios elementos iban a utilizar los mismos mensajes, y se evitaba la repeticion de logica.

•composición

porque se puede agregar criterios facilmente, y si a futuro se quiere cambiar el criterio solo se modifica ese criterio en particular


Justificar por qué y qué ventajas le dio.

 
 */





