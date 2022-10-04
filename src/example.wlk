import wollok.game.*
import jugador.*
import enemigo.*
import bala.*

object juego{
	var property tiempoDeSpawn = 3000
	const pantallaX = 23
	const pantallaY = 14
	const property enemigos = []
	
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
  		//MOVER ENEMIGOS
  		game.onTick(500, "moverse", {enemigos.forEach({e => e.moverse()})})
  		//SPRINT ENEMIGOS
  		enemigos.forEach({e => e.cambiarImagen()})
  		game.onTick(1600, "sprint", {enemigos.forEach({e => e.cambiarImagen()})})
  		//SPRINT JUGADOR
  		jugador.cambiarImagen()
  		game.onTick(300, "sprint", {jugador.cambiarImagen()})
  	}
  
  	method spawnearEnemigos(){
  		game.onTick(tiempoDeSpawn, "crearEnemigo", {
  			const enemigo = new Enemigo(image = "enemigo1.png", position = game.at(pantallaX - 1, 0.randomUpTo(pantallaY)), irAbajo = true)
  			game.addVisual(enemigo)
  			enemigos.add(enemigo)										
  		})
  	}
}

//SONIDOS
const musicaDeFondo = game.sound("BackgroundSound.mp3")
const eliminacionEnemigo = game.sound("death.wav")
//JUGADORES
const jugador = new Jugador(image = "jugador1.png", position = game.origin())
//ENEMIGOS
//const enemigo = new Enemigo(imagen = "enemigo.png", position = game.at(15, 3))
//OBJETOS
const bala = new bala()