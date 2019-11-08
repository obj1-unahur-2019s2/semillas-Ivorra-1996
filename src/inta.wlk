object inta {
	var property parcelas = []
	
	method cantidadDePlantasPorParcela(){
		return parcelas.sum({parcela => parcela.plantas()})
	}
	method cantidadDeParcelas(){
		return parcelas.size()
	}
	method promedioDePlantas(){
		return self.cantidadDePlantasPorParcela() / self.cantidadDeParcelas()
	}
	
	method masAutosustentable(){
		return (parcelas.filter({parcela => parcela.plantas().size() > 4})).max({parcela => parcela.seAsociaBien()})
	}
}
