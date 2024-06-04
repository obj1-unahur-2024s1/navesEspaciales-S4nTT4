class Nave {
	
	var velocidad = 0 
	var direccion = 0
	
	method initialize(){
		if(not direccion.between(10,-10))
		   self.error("direccion Incorrecta")
	}
	
	method acelerar(cuanto){
		velocidad = 100000.min(velocidad + cuanto)
	}
	
	method desacelerar(cuanto){
		velocidad = 0.max(velocidad - cuanto)
	}
	
	method irHaciaElSol(){
		direccion = 10
	}
	
	method escaparDelSol(){
		direccion = -10
	}
	
	method ponerseParaleloAlSol(){
		direccion = 0
	}
	
	method acecarseUnPocoAlSol(){
		direccion = 10.min(direccion + 1)
	}
	
	method alejarseUnPocoDelSol(){
		direccion = (-10.max).(direccion - 1)
	}
}

class Balisa inherits Nave {
	
	var color = 
	method initialize(){
		if (not ["Rojo","Verde","Azul"]).contains(color)
			self.error("Color no valido")
	}
	
	method cambiarColorBaliza(nuevoColor){
		self.validarColores()
		color = nuevoColor
		
	}
	
	method prepararViaje(){
		self.cambiarColorBaliza("Verde")
	}
	
	
}

class Pasajeros inherits Nave{
	
	var property cantidadPaajeros
	var racionesComida = 0
	var bebidas = 0
	
	method racionesComida(unaCantidad){
		racionesComida = unaCantidad
	}
	
	method bebidas(unaCantidad){
		racionesComida = unaCantidad
	}
}



























