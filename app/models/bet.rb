class Bet < ActiveRecord::Base
  
  def initialize(attribute = {})
  	attribute[:target] = Game.spin()
  	super(attribute)
  end

  belongs_to :game
  belongs_to :player

  def get_code
    "B-#{id.to_s.rjust(5, '0')}"
  end

  def pay(game)
  	if target == game.result
  		case target
  		when "Verde"
  			player.balance += 15 * amount
  		when "Rojo"
  			player.balance += 2 * amount
  		when "Negro"
  			player.balance += 2 * amount
  		end
  		player.save
  	end
  end
end
