import wollok.game.*
class Character {
	var property position
	var property image
	
	method destroy() {game.removeVisual(self)}
	
}
