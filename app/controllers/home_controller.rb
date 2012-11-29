require 'net/http'
require 'nokogiri'
require "time"

class HomeController < ApplicationController

  def index
   	start_time = Time.now 
		pst = ActiveSupport::TimeZone["Pacific Time (US & Canada)"]
		@pst= pst.at(start_time).strftime("%H:%M %p %Z")
		noon = Time.parse("15:00 P.M.")
		noon = pst.at(noon).strftime("%H:%M %p %Z")
		
		@is_noon = 1
		# going to office 
		# set your preferences here orig= ? and set API key 
		if @pst < noon 
			@is_noon = 0 
			result = Net::HTTP.get(URI.parse('http://api.bart.gov/api/etd.aspx?cmd=etd&orig=dbrk&key=YOUR_API_KEY'))
			doc = Nokogiri::XML(result)
			@links = doc.xpath('//root/station/etd/estimate').map do |i|
				# choose your direction
				if i.xpath('direction').text()=="South"
					{'destination' => i.parent().xpath('destination').text(),'dir'=> i.xpath('direction').text(),
					'minutes'=> i.xpath('minutes').text(),'cars'=> i.xpath('length').text(),
					'plat'=> i.xpath('platform').text(),'hex'=> i.xpath('hexcolor').text()}
				end
			end	
		# going home 
		# set your preferences here orig= ? and set API key 
		else
			result = Net::HTTP.get(URI.parse('http://api.bart.gov/api/etd.aspx?cmd=etd&orig=MONT&key=YOUR_API_KEY'))
			doc = Nokogiri::XML(result)
			@links = doc.xpath('//root/station/etd/estimate').map do |i|
			  # choose your direction
			 	if i.xpath('direction').text()=="North"
			    {'destination' => i.parent().xpath('destination').text(),'dir'=> i.xpath('direction').text(),
					'minutes'=> i.xpath('minutes').text(),'cars'=> i.xpath('length').text(),
					'plat'=> i.xpath('platform').text(),'hex'=> i.xpath('hexcolor').text()}
			 	end
			end
		end
  end

end
