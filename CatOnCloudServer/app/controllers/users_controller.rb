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
    puts(@user.sublist)
    if @user != nil
      for id in @user.sublist
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
    # Machine Learning
    res = []
    id = params["id"]
    @user = User.find(id)
    # Picture of the user's latest subscribed cat
    cats_image
    target = Cat.find(@user.sublist[sublist.count]).picsUrl[0]
    for (Cat.all).each do |cat|
      cats_image = {cat => cat.picsUrl[0]}
    end

    

    render json: res
  end

  def updated? ()
    true
  end       

  def suggest_similar(target,cats_image)
    project_id = "clean-sequencer-183609"
    vision = Google::Cloud::Vision.new project: project_id
    if (updated?)
      keys = cats_image.keys
      data = {} # hashmap
      data.default = []
      bestImages = {}
      bestImages.default = 1.0


      keys.each do |cat|
        data[cat] = (vision.image cat.picsUrl[0]).labels
      end

      tar_lab = (vision.image target).labels

      keys.each do |cat|
          data.fetch(cat, nil).each do |dest_label|
               tar_lab.each do |origin_label|
                  diff = (1.0 - (dest_label.score - origin_label.score))
                  bestImages[cat] = bestImages.fetch(cat,1.0) * diff
              end
            end
          end
        end
        return Hash[bestImages.sort.reverse].keys
    end

  end
