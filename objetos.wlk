/** First Wollok example */
import wollok.game.*

object lionel {
	const objetivo = pelota
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
	method taquito() {
	  self.validarSiPelotaEstaEnLionel()
	  objetivo.moverAtras()
	}

	method validarSiPelotaEstaEnLionel() {
	  if (not self.estaSobreLaPelota()){
		self.error("No esta sobre la pelota")
	  }
	}

	method estaSobreLaPelota() {
	  return position == objetivo.position()
	}

	method patear(){
		self.validarPatear()
		objetivo.patear()
	}
	method validarPatear(){
		if(self.position() != objetivo.position()){
			self.error("La pelota no esta aca")
		}
	}
	method buscar() {
		position = objetivo.position()
	}
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)


	method moverAtras() {
	  position = game.at(0.max(position.x()-2), position.y())
	}	

	method inicio() {
		position = game.at(0,5)
	}

	method patear(){
		position = game.at((position.x() + 3).min(game.width() - 1), position.y())
	}
}
