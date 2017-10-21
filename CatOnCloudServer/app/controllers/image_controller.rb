class ImageController < ApplicationController

  def upload
    @item = Item.new
    @item.picture = params["picture"]

    if @item.save
      render json: {status: :created, location: @item}
  	else
  	  render json: {status: :unprocessable_entity, err: @item.errors}
  	end
  end
end