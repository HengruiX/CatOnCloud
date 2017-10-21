Rails.application.routes.draw do
  resources :items
	root "application#hello"
	post "posts/create" => "posts#create"

	# images
	post "image/upload" => "image#upload"
	get "image/get_all" => "image#get_all"
end
