module ApplicationHelper
	def as_money(value)
		value = value.to_s
		"$ #{ActionController::Base.helpers.number_with_delimiter(value, delimiter: ".")}"
	end

	def yes_no(value)
		return "Sí" if value === true
		"No"
	end
end
