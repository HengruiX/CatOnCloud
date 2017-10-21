class NewcatsController < ApplicationController
	def create_new
		@newcat = Newcat.new
		@newcat.name = params["name"]
		@newcat.description = params["description"]
		urls = []
		for i in params["image_ids"]
      		@item = Item.find(i)
      		urls.push(@item.picture.url(:medium))
    	end
		@newcat.pics = urls
		@newcat.location = params["location"]
		@newcat.interested = 1
		if @newcat.save
	      render json: {id: @newcat.id}
	    else
	      render json: {status: :unprocessable_entity, err: @newcat.errors}
	    end
	end

	def add_image
		@newcat = Newcat.find(params["newcat_id"])
		image_id = params["image_id"]
		@newcat.pics.push(Item.find(image_id).picture.url(:medium))
	end

	def newcatarround
		threshold = 10
		testloc = params["location"]
		cats = Cat.all
		res = []
		for @cat in cats
			dis = ((@cat.location[0].to_i - testloc[0].to_i).square +(@cat.location[2].to_i - testloc[2].to_i).square).sqrt
			if dis*70 < threshold
				res.push(@cat)
			end
		end
		render json:res
	end

	def interested
		newcat_id = params["newcat_id"]
	    @newcat = Newcat.find(newcat_id)
	    @newcat.interested += 1
	end
end
