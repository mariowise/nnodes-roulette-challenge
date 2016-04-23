class Player < ActiveRecord::Base
	self.per_page = 10

	def initialize(attributes = {})
		attr_with_defaults = { :balance => 10000 }.merge(attributes)
		super(attr_with_defaults)
	end
end
