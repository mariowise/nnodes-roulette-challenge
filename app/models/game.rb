class Game < ActiveRecord::Base
	self.per_page = 10

	has_many :bets
	has_many :players, :through => :bets

	def amount 
		0
	end

	# Crear un juego
	# - Tirar la ruleta
	# - Obtener los jugadores
	# - A cada jugador calcularle su apuesta (API clima)
	# - Revisar quien ganó
	# - Pagar los premios
end
