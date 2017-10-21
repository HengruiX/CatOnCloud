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

	# user
	get "user/info" => "user#info"
	get "user/owned_cats" => "user#owned_cats"
	get "user/subscribed_cats" => "user#subscribed_cats"

	#cat
	get "recommanded_cats" => "user#recommanded_cats"

end
