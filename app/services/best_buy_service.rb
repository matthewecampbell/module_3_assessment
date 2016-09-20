class BestBuyService

  def initialize
    @_conn = Faraday.new(:url => 'https://api.bestbuy.com')
  end

  def find_stores_by_zip(zip)
    response = conn.get do |req|
       req.url "/v1/stores(area(#{zip},25))"
       req.params['show'] = 'storeId,longName,city,distance,phone,storeType'
       req.params['apiKey'] = ENV['BEST_BUY_KEY']
       req.params['pageSize'] = '15'
       req.params['format'] = 'json'
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
