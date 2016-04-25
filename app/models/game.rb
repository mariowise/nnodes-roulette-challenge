class Game < ActiveRecord::Base
	self.per_page = 10

	def initialize(args = {})
		args[:result] ||= Game.spin()
		super(args)
	end

	has_many :bets, :dependent => :destroy do 
		def build(args = {})
			if p = args[:player]
				if p.balance <= 1000 
					amount = p.balance
				elsif !Forecast.rain_comming?
					amount = (( (8 + rand(8)).to_f / 100 ) * p.balance).to_i
				else
					amount = (( (4 + rand(7)).to_f / 100 ) * p.balance).to_i
				end
				args[:amount] = amount
			end
			bet = super(args)
			bet.amount = 0 if bet.target == "Ninguno"
			return bet
		end
	end
	has_many :players, :through => :bets

	def self.create
		Game.transaction do 
			game = self.new 
			Player.where("balance > 0").each do |player|
				bet = game.bets.build(player: player)  					# Crear apuesta
				player.balance -= bet.amount										# Descontar el saldo del jugador
				if bet.target == game.result										# Si el usuario ganó
					case bet.target																
		  		when "Verde"; player.balance += 15 * bet.amount		# Verde paga 15 veces lo apostado
		  		when "Rojo"; 	player.balance += 2 * bet.amount		# Rojo Paga 2 veces lo apostado
		  		when "Negro"; player.balance += 2 * bet.amount 		# Negro paga 2 veces lo apostado
		  		end
				end
				player.save 			# Se guarda el balance del jugador
			end
			game.save 		# Se guarda el juego y todas sus apuestas
			return game
		end 
	end

	def self.spin
		case rand(100) + 1 				# 100%
			when 1..2 	then "Verde"  # 2%
			when 3..46 	then "Rojo"		# 44%
			when 47..90 then "Negro"	# 44%
			else "Ninguno"						# 10%
		end
	end

	def get_code
		"P-#{id.to_s.rjust(5, '0')}"
	end

	def amount 
		bets.sum(:amount)
	end

	def winners
		bets
			.where(:target => result)
			.where.not(:target => "Ninguno")
	end
end
