class BestBuyService

  def initialize
    @_conn = Faraday.new(:url => 'https://api.bestbuy.com')
  end

  def zip_code_stores(zip)
    response = conn.get do |request|
      request.url "/v1/stores(area(#{zip}, 25))"
      request.params['show'] = 'longName,city,distance,phone,storeType'
      request.params['pageSize'] = '15'
      request.params['apiKey'] = ENV['BEST_BUY_KEY']
      request.params['format'] = 'json'
    end
    parse_response(response)
  end


  private

  def conn
    @_conn
  end

  def parse_response(response)
    JSON.parse(response.body)
  end
end
