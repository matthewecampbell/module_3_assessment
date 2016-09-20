class Api::V1::ItemsController < Api::V1::BaseController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.delete
      render json: {}, status: 204
    end
  end
end
