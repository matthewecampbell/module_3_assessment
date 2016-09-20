class SearchController < ApplicationController

  def index
    @stores, @count = BestBuyStore.find_stores_by_zip(params[:zip])
  end

end
