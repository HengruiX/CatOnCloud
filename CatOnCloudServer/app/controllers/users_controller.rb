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
      render json: {status: :created, location: @user}
    else
      render json: {status: :unprocessable_entity, err: @user.errors}
    end
  end

  def subscribe
    cat_id = params["cat_id"]
    @user = User.find(params["user_id"])
    @cat = Cat.find(cat_id)
    if @user != nil && @cat != nil
      @user.sublist.push(cat_id)
      @user.save
      @cat.subscription = @cat.subscription.to_i + 1
      @cat.save
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
    a = rand(Cat.count)
    b = rand(Cat.count)
    c = rand(Cat.count)

    a_rec = Cat.offset(a).first
    b_rec = Cat.offset(b).first
    c_rec = Cat.offset(c).first

    render json: [a_rec, b_rec, c_rec]
  end

end
