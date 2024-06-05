class Nave {
	
	var velocidad = 0 
	var direccion = 0
	var combustible = 0
	
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
		direccion = (-10).max(direccion - 1)
	}
	
	method cargarCombustible(unaCantidad){
		combustible = combustible + 0.min(unaCantidad)
	}
	
	method descargarCombustible(unaCantidad){
		combustible = combustible - 0.max(unaCantidad)
	}
	
	method accionAdicional(){
		self.cargarCombustible(30000)
		self.acelerar(5000)
	}
	
	method estaTranquila() = combustible >= 4000 
	
	method prepararViaje()
	
	
}

class Balisa inherits Nave {
	
	var color
	method initialize(){
		self.validarColores(color)
	}
	
	method validarColores(unColor){
		if(not ["rojo","verde","azul"].contains(unColor))
		   self.
	}
	
	method cambiarColorBaliza(nuevoColor){
		self.validarColores(nuevoColor)
	}
	
	override method prepararViaje(){
		self.cambiarColorBaliza("verde")
		self.ponerseParaleloAlSol()
		self.accionAdicional()
	}
	
	
}

class Pasajero inherits Nave{
	
	var property cantidadPasajeros
	var racionesComida = 0
	var bebidas = 0
	
	method cargarComida(unaCantidad){racionesComida = racionesComida + unaCantidad}
	method cargarBebida(unaCantidad){bebidas = bebidas + unaCantidad}
	method descargarComida(unaCantidad){racionesComida = racionesComida - 0.max(unaCantidad)}
	method descargarBebida(unaCantidad){bebidas = bebidas - 0.max(unaCantidad)}
	
	override method prepararViaje(){
		self.cargarComida(4 * cantidadPasajeros)
		self.cargarBebida(6 * cantidadPasajeros)
		self.acecarseUnPocoAlSol()
		self.accionAdicional()
	}
}


class Combate inherits Nave {
	var visible = true
	var misilesDesplegados = false
	const mensajesEmitidos = []
	
	method ponerseVisible(){visible = true}
	method ponerseInvisible(){visible = false}
	method estaInvisible() = not visible
	
	method desplegarMisiles(){misilesDesplegados = true}
	method replegarMisiles(){misilesDesplegados = false}
	method misilesDesplegables() = misilesDesplegados
	
	method emitirMensaje(unMensaje){mensajesEmitidos.add(unMensaje)}
	method mensajesEmitidos() = mensajesEmitidos
	method primerMensajeEmitido() = mensajesEmitidos.first()
	method ultimoMensajeEmitido() = mensajesEmitidos.last()
	method esEscueta() = mensajesEmitidos.all({mensajeEmitido => mensajeEmitido.size() <= 30})
	method emitioMensaje(unMensaje){return mensajesEmitidos.contains(unMensaje)}
	
	override method prepararViaje(){
		self.ponerseVisible()
		self.replegarMisiles()
		self.acelerar(15000)
		self.emitirMensaje("Saliendo en Mision")
		self.accionAdicional()
	}
	
	override method accionAdicional(){
		self.acelerar(15000)
	}
	
	override method estaTranquila() = super() && not misilesDesplegados
}

class Hospital inherits Pasajero {
	var tienePreparadosLosQuirofanos = false
	method prepararQuirofano(){
		tienePreparadosLosQuirofanos = true
	}
	
	method desprepararQuirofano(){
		tienePreparadosLosQuirofanos = false
	}
	
	override method estaTranquila()= super() && not tienePreparadosLosQuirofanos
}

class Sigilosa inherits Combate {
	override method estaTranquila()= super() && visible
}
























