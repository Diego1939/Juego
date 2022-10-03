import wollok.game.*

class Enemigo {
	var property position
	var irAbajo
  	var imagen;
  	var tiempoSprint = 1500
  
 	method image() = imagen // Hacerlo generico
 	
 	method destroy() {game.removeVisual(self)}
 	
 	method moverse(){
 		game.onTick(500, "moverse", {	
 			self.verificarLimitaciones()
 			if(irAbajo){position = position.down(1).left(1)}
 			else{position = position.up(1).left(1)}
 		})
 	}
 	method verificarLimitaciones(){
 		if( position.y() <= 0 ){
 			position = position.up(1).left(1)
 			irAbajo = false
 		}
 		if( position.y() >= 13){
 			position = position.down(1).left(1)
 			irAbajo = true
 		}
 	}
 	
 	method cambiarImagen(){ //Revisar como funciona
 		imagen = "enemigo2.png"
 		game.schedule(tiempoSprint, {imagen = "enemigo3.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo4.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo5.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo6.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo7.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo8.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo9.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo10.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo11.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo12.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo13.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo14.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo15.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo16.png"})
 		game.schedule(tiempoSprint, {imagen = "enemigo1.png"})
 	}
}
