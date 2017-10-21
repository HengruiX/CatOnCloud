class CatsController < ApplicationController

	def create_cat
		@cat = Cat.new
		@cat.name = params["name"]
		@cat.description = params["description"]
		@cat.picsUrl = params["picsUrl"]
		@cat.rate = params["rate"]
		@cat.location = params["location"]
		@cat.subscription = 0
		@cat.owner_id = params["owner_id"]
		@cat.save
	end

	# get subsribe number
	def subscribed
		id = params["id"]
		@cat=Cat.find(id)
		@cat.subscription += 1
		@cat.save
	end


	# get sorted post of a specific cat
	def get_post
		id = params["id"]
		posts = []
		Post.where("cat_id = #{id}".find_each do |post|)
			posts.push(cat)
		end
		posts = posts.sample(min(10,array.count))
		posts.sort_by(|post| post.time)
		render json:posts
	end





	def getcats
		render json: Cat.all
	end

end
