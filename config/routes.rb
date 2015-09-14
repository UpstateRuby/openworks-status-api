Rails.application.routes.draw do
	jsonapi_resources :locations
	jsonapi_resources :things
end
