class PagesController < ApplicationController
  def show
  	puts "1"
    render template: "pages/#{params[:page]}"
    puts "2"
    require 'net/http' 
	url = URI.parse('http://www.mta.me') 
	req = Net::HTTP::Get.new(url.to_s)
	http.use_ssl = true
	res = Net::HTTP.start(url.host, url.port) {|http| 
	   http.request(req)
	}
	puts res.code
	@code = res.body 
	puts @code
	puts "3"
  end

end