Rails.application.routes.draw do
  devise_for :users
	jsonapi_resources :locations
	jsonapi_resources :things
	jsonapi_resources :properties
end
