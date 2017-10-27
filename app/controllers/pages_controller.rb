class PagesController < ApplicationController
  def show
    render template: "pages/#{params[:page]}"
  #   puts "test1"
  #   require 'net/http' 
		# url = URI.parse('http://www.mta.me') 
		# req = Net::HTTP::Get.new(url.to_s) 
		# res = Net::HTTP.start(url.host, url.port) {|http| 
		#    http.request(req)
		# }
		# puts res.code
		# @code = res.body 
		# puts @code
  	end

end