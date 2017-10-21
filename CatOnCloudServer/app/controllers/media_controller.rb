class MediaController < ApplicationController

  def upload
    @item = Item.new
    @item.type = params["type"]
    @item.picture = params["media"]

    if @item.save
      render json: {status: :created, location: @item}
  	else
  	  render json: {status: :unprocessable_entity, err: @item.errors}
  	end
  end
end
