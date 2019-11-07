import parcelas.*
class Planta{
	var property cuantasHorasDeSolTolera
	var property obtencionDeLaSemilla = 0
	var property altura = 0
	
	method esFuerte(){return 10 < self.cuantasHorasDeSolTolera()} // bool
	method daNuevasSemillas() // bool
	method parcelasIdeales(parcela)
}
class Menta inherits Planta{
	override method cuantasHorasDeSolTolera(){
		return 6 
	}
	override method esFuerte(){
		return super() and  self.cuantasHorasDeSolTolera() < self.cuantasHorasDeSolTolera()
	}
	method espacio(){return altura * 3}
	
	override method daNuevasSemillas(){
		return altura > 0.4
	}
	override method parcelasIdeales(parcela){
		return parcela.superficie() > 6 
	}	 
}
class Soja inherits Planta{
		override method cuantasHorasDeSolTolera(){
			if(altura < 0.5){cuantasHorasDeSolTolera = 6}
			else if(altura.between(0.5,1)){cuantasHorasDeSolTolera=7}
			else if(altura > 1){cuantasHorasDeSolTolera=9}
			return cuantasHorasDeSolTolera
			}
		override method daNuevasSemillas(){
			return self.obtencionDeLaSemilla() > 2007 and altura > 1
		}
				method espacio(){return altura /2}
		override method parcelasIdeales(parcela){
			return parcela.horasDeSol() == self.cuantasHorasDeSolTolera()
	}
			}
class Quinoa inherits Planta{
	override method cuantasHorasDeSolTolera(cantidad){
		return cantidad
	}
	override method altura(){
		return 0.5
	}
	override method daNuevasSemillas(){
		return self.obtencionDeLaSemilla() < 2005
	}
	override method parcelasIdeales(parcela){
		return parcela.superficie() > 1.5
	}
}
class SojaTransgenica inherits Soja {
	override method daNuevasSemillas(){return false}
	override method parcelasIdeales(parcela){
		return parcela.cantidadMaxima() == 1
	}
}
class Hierbabuena inherits Menta{
	override method espacio(){return super() * 2 }
}