Rails.application.routes.draw do
	# jsonapi_resources :locations
	# jsonapi_resources :things
	# jsonapi_resources :properties

  resources :locations do
    resources :things
  end
  resources :things do
    resources :properties
  end
  resources :properties do
    resource :thing
  end
end
