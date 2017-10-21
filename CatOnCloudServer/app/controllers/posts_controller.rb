class PostsController < ApplicationController

  # POST /posts
  def create
    @post = Post.new

    @post.time = Time.now
    @post.likes = 0
    urls = []

    for i in params["image_ids"]
      @item = Item.find(i)
      urls.push(@item.picture.url(:medium))
    end

    @post.imageURLS = urls

    if @post.save
      render json: {status: :created, location: @post}
    else
      render json: {status: :unprocessable_entity, err: @post.errors}
    end
  end

end
