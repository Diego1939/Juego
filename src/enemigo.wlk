import wollok.game.*
import Character.* 
import example.*

class Enemigo inherits Character {
	var irAbajo
  	var tiempoSprint = 100
 	
 	method moverse(){
 			
 			self.verificarLimitaciones()
 			if(irAbajo){position = position.down(1).left(1)}
 			else{position = position.up(1).left(1)}
 	
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
 		if(	position.x() < 0){ juego.enemigos().remove(self) self.destroy()} //Elimina enemigos si se van de la pantalla
 	}
 	
 	method cambiarImagen(){ //Revisar como funciona
 		game.schedule(tiempoSprint, {image = "enemigo3.png"})
 		game.schedule(tiempoSprint*2, {image = "enemigo4.png"})
 		game.schedule(tiempoSprint*3, {image = "enemigo5.png"})
 		game.schedule(tiempoSprint*4, {image = "enemigo6.png"})
 		game.schedule(tiempoSprint*5, {image = "enemigo7.png"})
 		game.schedule(tiempoSprint*6, {image = "enemigo8.png"})
 		game.schedule(tiempoSprint*7, {image = "enemigo9.png"})
 		game.schedule(tiempoSprint*8, {image = "enemigo10.png"})
 		game.schedule(tiempoSprint*9, {image = "enemigo11.png"})
 		game.schedule(tiempoSprint*10, {image = "enemigo12.png"})
 		game.schedule(tiempoSprint*11, {image = "enemigo13.png"})
 		game.schedule(tiempoSprint*12, {image = "enemigo14.png"})
 		game.schedule(tiempoSprint*13, {image = "enemigo15.png"})
 		game.schedule(tiempoSprint*14, {image = "enemigo16.png"})
 		game.schedule(tiempoSprint*15, {image = "enemigo1.png"})
 		game.schedule(tiempoSprint*16, {image = "enemigo2.png"})
 	}
}
