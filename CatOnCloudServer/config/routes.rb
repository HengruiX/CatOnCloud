Rails.application.routes.draw do
  resources :short_videos
	root "application#hello"
	post "/newcat"=> "cats#create_cat"
	get "/getcats" => "cats#getcats"
	post "/upload" => "attachment#create"
end
