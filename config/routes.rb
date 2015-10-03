Rails.application.routes.draw do
	jsonapi_resources :locations
	jsonapi_resources :things
	jsonapi_resources :properties
end
