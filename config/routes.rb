Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:new, :create]
  get '/login' => 'sessions#new' # sign in form
  post '/login' => 'sessions#create' # sign in action
  delete '/login' => 'sessions#destroy' # sign out
  # See rails guide for routing, in particular nested routes
end
