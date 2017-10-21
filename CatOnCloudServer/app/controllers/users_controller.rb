class UsersController < ApplicationController
  def info
    @user = User.find(params["id"])
    render json: @user
  end

  def create
    @user = User.new
    @user.name = params["name"]
    @user.intro = params["intro"]
    @user.sublist = []
    if @user.save
      render json: {id:@user.id}
    else
      render json: {status: :unprocessable_entity, err: @user.errors}
    end
  end

  def subscribe
    cat_id = params["cat_id"]
    @user = User.find(params["user_id"])
    @cat = Cat.find(cat_id)
    if @user != nil && @cat != nil
      if ! @user.sublist.include? cat_id
        @user.sublist.push(cat_id)
        @cat.subs = 1 + @cat.subs.to_i
      end
      @cat.save
      @user.save
    end
  end

  def subscribed_cats
    @user = User.find(params["id"])
    res = []
    puts(@user.subscribes)
    if @user != nil
      for id in @user.subscribes
        res.push(Cat.find(id))
      end
    end
    render json: res
  end

  def owned_cats
    id = params["id"]
    res = []
    Cat.where("owner_id = #{id}").find_each do |cat|
      res.push(cat)
    end
    render json: res
  end

  def recommanded_cats
    # Naive implementation
    res = []
    id = params["id"]
    @user = User.find(id)
    Cat.where("owner_id != #{id}").find_each do |cat|
      if ! @user.sublist.include? cat.id
        res.push(cat)
      end
    end

    render json: res
  end

end
