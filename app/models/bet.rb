class Bet < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  # def confidence_level
  # 	require 'nokogiri'
  # 	require 'open-uri'
  # 	api = "http://www.myweather2.com/developer/weather.ashx?uac=z1Ev2blpkG&uref=6fbacc4c-d5da-4189-b1e8-610f0b82f3b7"
  # 	request = open(api)
  # 	xml = Nokogiri::XML(open(api))
  # end

  
end
