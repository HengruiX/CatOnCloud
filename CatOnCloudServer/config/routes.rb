Rails.application.routes.draw do
	resources :items
  	resources :short_videos
	root "application#hello"
	post "/newcat"=> "cats#create_cat"
	get "/getcats" => "cats#getcats"
	post "/upload" => "attachment#create"

  
	root "application#hello"
	post "posts/create" => "posts#create"

	# images
	post "image/upload" => "image#upload"
	get "image/get_all" => "image#get_all"

end
