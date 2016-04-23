class Game < ActiveRecord::Base
	self.per_page = 10

	has_many :bets
	has_many :players, :through => :bets
end
