import wollok.game.*
import jugador.*
import enemigo.*
import bala.*

object juego{
	var property tiempoDeSpawn = 3000
	const pantallaX = 23
	const pantallaY = 14
	
  	method iniciar(){
  		game.width(pantallaX)
  		game.height(pantallaY)
  		game.cellSize(50)
  		game.title("Juego")
  		game.start()
  	
  		game.addVisualCharacter(jugador)
  		
  	
  		musicaDeFondo.play()
  		musicaDeFondo.shouldLoop(true)
  	
  		//COLISION CON ENEMIGOS
  	
  		game.whenCollideDo(jugador, { elemento => 
    		elemento.destroy()
    		game.say(jugador, "Auch")
    		jugador.vida(jugador.vida() - 1)
    		if(jugador.vida() == 0){
    			jugador.destroy()
    		}
  		})
  		
  		//SPAWNEAR ENEMIGOS
  		self.spawnearEnemigos()
  	}
  
  	method spawnearEnemigos(){
  		game.onTick(tiempoDeSpawn, "crearEnemigo", {
  			const enemigo = new Enemigo(imagen = "enemigo1.png", position = game.at(pantallaX - 1, 0.randomUpTo(pantallaY)), irAbajo = true)
  			game.addVisual(enemigo)
  			enemigo.moverse()
  			//enemigo.cambiarImagen() ver bien como funcionan las sprints aca										
  		})
  		
  	}
  
}

//SONIDOS
const musicaDeFondo = game.sound("BackgroundSound.mp3")
const eliminacionEnemigo = game.sound("death.wav")
//JUGADORES
const jugador = new Jugador(imagen = "jugador1.png")
//ENEMIGOS
//const enemigo = new Enemigo(imagen = "enemigo.png", position = game.at(15, 3))
//OBJETOS
const bala = new bala()