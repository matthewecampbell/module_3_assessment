class BestBuyService

  def initialize
    @_conn = Faraday.new
  end


  private

  def conn
    @_conn
  end
end
