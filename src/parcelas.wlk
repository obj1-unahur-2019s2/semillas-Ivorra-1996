import semillas.*
class Parcela {
	var property ancho 
	var property largo
	var property horasDeSol
	var plantas = []
	
//* conocer la **superficie** de la parcela, que se calcula... multiplicando `ancho` por `largo`.
	method superficie(){return ancho * largo}
//* saber la **cantidad máxima** de plantas que tolera, que se calcula de la siguiente manera: si el `ancho` es mayor que el `largo`,
//la cuenta es `superficie / 5`.
//Si no `superficie / 3 + largo`.
	method cantidadMaxima(){
		if(self.ancho() > self.largo()){return self.superficie() / 5}
		else{return self.superficie() / 3 + largo}}
//* saber si **tiene complicaciones**, lo cual es así si alguna de sus plantas tolera menos sol del que recibe la parcela.
	method tieneComplicaciones(){return plantas.any({planta => planta.horasDeSolTolera() < horasDeSol })}
//* poder **plantar una planta** que se recibe por parámetro. El efecto que produce es que se agregue a la colección.
//Esto debe arrojar un error si al plantar se supera la cantidad máxima _o bien_ si la parcela recibe al menos 2 horas más de sol que los que la planta tolera.
	method plantarUnaPlanta(planta){
		if(plantas.size() < self.cantidadMaxima() or self.horasDeSol() +2 >= planta.horasDeSolTolera()){ plantas.add(plantas)}
		else(self.error("no hay mas espacio"))
	}
	method seAsociaBien()
}
//Para las parcelas ecológicas: que la parcela no tenga complicaciones y sea ideal para la planta.
class ParcelasEcologicas inherits Parcela{
	override method seAsociaBien(){return (not self.tieneComplicaciones()) and plantas.esIdeal(self)}
}
/*ara las parcelas industriales: que haya como máximo 2 plantas y que la planta en cuestión sea fuerte.*/
class ParcelasIndustriales inherits Parcela{
	override method seAsociaBien(){
	return (plantas.size() > 2) and plantas.esFuerte()}
}
/*Una parcela de 20 metros de ancho por 1 metro de largo que recibe 8 horas de sol por día,
 *tiene una superficie de 20 metros cuadrados y la cantidad máxima de plantas que tolera es 4.
 *Si a esa parcela le plantamos 4 plantas de soja de más de 1 metro (que toleran 9 horas de sol),
 *no tendría complicaciones. Si intentaramos agregar una quinta planta, se superaría la cantidad máxima y
 *nos arrojaría un error.*/