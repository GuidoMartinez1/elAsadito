import personas.*
import elementos.*

class Criterio{
	 method entregarElemento(receptor,emisor,elemento){
	 	emisor.elementosCerca().remove(elemento)
	 }
}
object sordo inherits Criterio{
	override method entregarElemento(receptor,emisor,elemento){
		const primerElemento=emisor.elementosCerca().first()
		receptor.recibirElemento(primerElemento)
		super(receptor,emisor,primerElemento)
	}
}
object pasanTodosLosElementos inherits Criterio {
	override method entregarElemento(receptor,emisor,elemento){
		receptor.elementosCerca().addAll(emisor.elementosCerca())
		emisor.elementosCerca().clear()
	}
}
object cambioPosicion inherits Criterio{
	override method entregarElemento(receptor,emisor,elemento){
		emisor.posicion(receptor.posicion())
		receptor.posicion(emisor.posicion())
	}
}
object pasaElementoSolicitado inherits Criterio{
	override method entregarElemento(receptor,emisor,elemento){
		receptor.recibirElemento(elemento)
		super(receptor,emisor,elemento)
	}
}