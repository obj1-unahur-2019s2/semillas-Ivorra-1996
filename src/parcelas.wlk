import semillas.*
class Parcelas {
	var property ancho = 0
	var property largo = 0
	var property horasDeSol = 0
	var plantas = []
	
	method superficie(){
		return ancho * largo 
	}
	method cantidadMaxima(){
		if(self.ancho() > self.largo()){return self.superficie() / 5}
		else{return self.superficie() / 3 + largo} 
	}
	method tieneComplicaciones(){
		return plantas.forEach({plantass => plantas.cuantasHorasDeSolTolera() < self.horasDeSol() })
	}
	 
	method plantarUnaPlanta(planta){
		if(plantas.size() < self.cantidadMaxima() or self.horasDeSol() +2 >= planta.cuantasHorasDeSolTolera()){ 
		plantas.add(plantas)
	}}
}
//Para las parcelas ecológicas: que la parcela no tenga complicaciones y sea ideal para la planta.
class ParcelasEcologicas inherits Parcelas{
	override method tieneComplicaciones(){
		return true 
	}
}
/*ara las parcelas industriales: que haya como máximo 2 plantas y que la planta en cuestión sea fuerte.*/
class ParcelasIndustriales inherits Parcelas{
	override method tieneComplicaciones(){
	return self.cantidadMaxima().min(2) and plantas.esFuerte()}
}
/*Una parcela de 20 metros de ancho por 1 metro de largo que recibe 8 horas de sol por día,
 *tiene una superficie de 20 metros cuadrados y la cantidad máxima de plantas que tolera es 4.
 *Si a esa parcela le plantamos 4 plantas de soja de más de 1 metro (que toleran 9 horas de sol),
 *no tendría complicaciones. Si intentaramos agregar una quinta planta, se superaría la cantidad máxima y
 *nos arrojaría un error.*/