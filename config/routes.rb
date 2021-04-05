Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
	  resources :events
	  get '/repos/:repo_id/events', to: 'events#show_repo_events'
	end
end
