class Player < ActiveRecord::Base
	self.per_page = 10

	def initialize(attributes = {})
		attr_with_defaults = { :balance => 10000 }.merge(attributes)
		super(attr_with_defaults)
	end

	has_many :bets
	has_many :games, :through => :bets

	validates :name, length: { in: 1..255 }
	validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
