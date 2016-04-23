module ApplicationHelper
	def as_money(value)
		value = value.to_s
		"$ #{ActionController::Base.helpers.number_with_delimiter(value, delimiter: ".")}"
	end
end
