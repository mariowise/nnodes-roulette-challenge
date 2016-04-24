class Game < ActiveRecord::Base
	self.per_page = 10

	has_many :bets do 
		def build(attributes = {})
			if p = attributes[:player]
				if p.balance <= 1000
					amount = p.balance
				elsif !Forecast.rain_comming?
					amount = (( (8 + rand(8)).to_f / 100 ) * p.balance).to_i
				else
					amount = (( (4 + rand(7)).to_f / 100 ) * p.balance).to_i
				end
				attributes[:amount] = amount
			end
			super(attributes)
		end
	end
	has_many :players, :through => :bets

	def self.create
		Game.transaction do 
			game = self.new 
			game.result = Game.spin()
			Player.where("balance > 0").each do |player|
				bet = game.bets.build(player: player)
				player.balance -= bet.amount
				bet.pay(game)
			end
			game.save
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
		bets.where(:target => result)
	end
end
