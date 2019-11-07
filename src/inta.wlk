object inta {
	var property parcelas = []
	
	method cantidadDePlantasPorParcela(){
		return parcelas.sum({platans => parcelas.plantas()})
	}
	method cantidadDeParcelas(){
		return parcelas.size()
	}
	method promedioDePlantas(){
		return self.cantidadDePlantasPorParcela() / self.cantidadDeParcelas()
	}
	
	method masAutosustentable(){
		
	}
}
