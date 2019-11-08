import parcelas.*

class Planta{
	var property anoDeObtencion
	var property altura
	var property horasDeSolTolera
	
	method esFuerte(){return self.horasDeSolTolera() >= 10}
	
	method daSemillas(){return self.esFuerte()}
	
	method espacioQueOcupa()
	
	method esIdeal(parcela)
}
/*### Menta
Tolera seis horas de sol al día.
Como condición alternativa para saber si da semillas,hay que mirar si su `altura` es mayor a 0.4 metros.
Como crece al ras del suelo, diremos que el espacio que ocupa es su altura multiplicada por 3.*/
class Menta inherits Planta{
//Tolera seis horas de sol al día.
	override method horasDeSolTolera(){return 6 }
//Se dice que una planta **es fuerte** si tolera más de 10 horas de sol al día, esto es igual para todas las plantas.
	override method esFuerte(){return 10 < self.horasDeSolTolera()}
//Como condición alternativa para saber si da semillas,hay que mirar si su `altura` es mayor a 0.4 metros.
	override method daSemillas(){return super() or self.altura() > 0.4}
//Como crece al ras del suelo, diremos que el espacio que ocupa es su altura multiplicada por 3.
	override method espacioQueOcupa(){return self.altura() * 3}
	
	override method esIdeal(parcela){
		return parcela.superficie() > 6 
	}
}
class Soja inherits Planta{
//La tolerancia al sol depende de su altura:
//* menor a 0.5 metros: 6 horas;
//* entre 0.5 y 1 metro: 7 horas;
//* más de 1 metro: 9 horas;
	   override method horasDeSolTolera(){
			return if(altura < 0.5){6}
			else if(altura.between(0.5,1)){7}
			else if(altura > 1){9}}
		override method daSemillas(){return self.anoDeObtencion() > 2007 and altura > 1}
		override method espacioQueOcupa(){return altura /2}
		override method esIdeal(parcela){return parcela.horasDeSol() == self.horasDeSolTolera()}
			}
class Quinoa inherits Planta{
	override method espacioQueOcupa(){return 0.5}
	override method daSemillas(){return super() or self.anoDeObtencion() < 2005}
	override method esIdeal(parcela){return (parcela.plantas().all({planta => planta.altura() < 1.5}))}
}
class SojaTransgenica inherits Soja {
	 override method daSemillas(){return false}
	override method esIdeal(parcela){
		return parcela.cantidadMaxima() == 1
	}
}
class Hierbabuena inherits Menta{
	override method espacioQueOcupa(){return super() * 2 }
}