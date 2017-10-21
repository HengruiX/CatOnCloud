class CatsController < ApplicationController

	def create_cat
		@cat = Cat.new
		@cat.name = params["name"]
		@cat.description = params["description"]
		@cat.picsUrl = params["picsUrl"]
		@cat.rate = params["rate"]
		@cat.location = params["location"]
		@cat.save
	end

	def getcats
		render json: Cat.all
	end

end
