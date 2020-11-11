import personas.*
import elementos.*

class CriterioAlimenticio {
	
	method puedeComer(comida) 
}

object vegetariano inherits CriterioAlimenticio {
	
	override method puedeComer(comida) = comida.noEsCarne()
}

object dietetico inherits CriterioAlimenticio {
	
	override method puedeComer(comida) = comida.calorias() < oms.caloriasRecomendadas()
}

object alternado inherits CriterioAlimenticio {
	
	
}

object combinado inherits CriterioAlimenticio {
	override method puedeComer(comida) = comida.criteriosAlimenticios().all({criterio => criterio.puedeComer(comida)})
}

object oms {
	
	var property caloriasRecomendadas = 500	
}



