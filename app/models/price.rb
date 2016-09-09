require 'net/http'

class Price

  def rate_usd
    price_hash["bpi"]["USD"]["rate"].to_f
  end


  private

  def price_response
    url = URI.parse('http://api.coindesk.com/v1/bpi/currentprice.json')
    request = Net::HTTP::Get.new(url.to_s)
    result = Net::HTTP.start(url.host, url.port) do |http|
      http.request(request)
    end
    
    result.body
  end

  def price_hash
    JSON.parse(price_response)
  end

  
end