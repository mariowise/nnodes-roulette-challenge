class Forecast < ActiveRecord::Base
	
	def self.request
		require 'nokogiri'
		require 'open-uri'
		
		api = "http://www.myweather2.com/developer/weather.ashx?uac=z1Ev2blpkG&uref=6fbacc4c-d5da-4189-b1e8-610f0b82f3b7"
		request = open(api)
		
		if request
			Nokogiri::XML(request).xpath("//forecast").each do |forecast|
				date = forecast.at("date").text
				f_day 	= forecast.at("day").at("weather_text").text
				f_night = forecast.at("night").at("weather_text").text
				text = "#{f_day}, #{f_night}"
				
				if !self.find_by(date: date)
					self.create({ date: date, text: text, rain: text.downcase.include?("rain") })
				end
			end
		end
	end

	def self.rain_comming?
		self.request if self.count == 0
		self
			.where(:date => Date.today..(Date.today + 6.days))
			.pluck(:rain)
			.include?(true)
	end
end
