import wollok.game.*

class Jugador {
  var property position = game.origin()
  var property vida = 3
  var imagen;
  
  method image() = imagen //Crear class personaje que reciba la imagenes y hacer subclases a los enemigos y a los jugadores, que entienda destroy e image
  
  method destroy() {game.removeVisual(self)}
  
}
