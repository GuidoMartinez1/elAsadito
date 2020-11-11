import personas.*
import criterios.*

class Comida {
	var property calorias
	
	const criteriosAlimenticios = []
	
	method criteriosAlimenticios() = criteriosAlimenticios
	
	method esCarne() 
	
	method noEsCarne() = not self.esCarne()
	
	method esPesada() = self.calorias() > 500
}
