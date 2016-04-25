class Player < ActiveRecord::Base
	self.per_page = 10
	acts_as_paranoid

	def initialize(attributes = {})
		attr_with_defaults = { :balance => 10000 }.merge(attributes)
		super(attr_with_defaults)
	end

	has_many :bets
	has_many :games, :through => :bets

	validates :name, length: { in: 1..255 }
	validates :balance, numericality: { greater_than_or_equal_to: 0 }

	def self.daily_bonus
		self.transaction do
			all.each do |player|
				player.balance += 10000
				player.save
			end
		end
	end

	def get_code
		"J-#{id.to_s.rjust(5, '0')}"
	end

	def to_s
		"#{name}"
	end
end
