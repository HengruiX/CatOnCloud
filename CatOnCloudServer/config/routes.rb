Rails.application.routes.draw do
	resources :items
  	resources :short_videos
	root "application#hello"
	post "newcat"=> "cats#create_cat"
	get "getcats" => "cats#getcats"
	get "onecat" => "cats#get_cat"
	get "getposts" => "cats#get_post"

  
	post "posts/create" => "posts#create"
	post "posts/liked" => "posts#liked"
	# images
	post "media/upload" => "media#upload" #tested

	# user
	get "user/info" => "users#info" # Tested
	get "user/owned_cats" => "users#owned_cats" # Not yet work
	get "user/subscribed_cats" => "users#subscribed_cats" # not yet work because of wrong type
	post "user/create" => "users#create" # Tested
	post "user/subscribed" => "users#subscribe" # Because of the wrong type of

	#cat
	get "user/recommanded_cats" => "users#recommanded_cats" # Tested




end
