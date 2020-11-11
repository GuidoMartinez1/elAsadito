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
	
}