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

  def create
    @item = Item.new(name: params[:name], description: params[:description], image_url: params[:image_url])
    if @item.save
      render json: {name: params[:name], description: params[:description], image_url: params[:image_url], id: @item.id}, status: 201
    end
  end
end
