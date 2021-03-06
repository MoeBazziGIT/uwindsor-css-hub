Rails.application.routes.draw do
  get 'events/index'

  get 'session/destroy', :as => 'logout'

  get 'auth/google_oauth2', :as => 'google_auth'
  match 'auth/:provider/callback' => 'session#create', :via => [:post, :get]

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html	  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "events#index"

  resources :events do
    get :guests, on: :member
  end

  resources :registration

  get '/discord', to: 'pages#discord', :as => 'discord_path'
  get '/guide', to: 'pages#guide', :as => 'guide'
  get '/discord/verifications/:id', to: 'verifications#show'
end
