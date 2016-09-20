class BestBuyStore < OpenStruct
  attr_reader :id, :long_name, :city, :distance, :phone, :type

  def initialize(raw_stores)
    @id = raw_stores["storeId"]
    @long_name = raw_stores["longName"]
    @city = raw_stores["city"]
    @distance = raw_stores["distance"]
    @phone = raw_stores["phone"]
    @type = raw_stores["storeType"]
  end

  def self.service
    @bbs = BestBuyService.new
  end

  def self.find_stores_by_zip(zip)
    raw_stores = service.find_stores_by_zip(zip)

    stores = raw_stores["stores"].map do |raw_store|
      BestBuyStore.new(raw_store)
    end

    return stores, raw_stores["total"]
  end
end
