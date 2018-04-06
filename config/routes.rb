Rails.application.routes.draw do
  root :to => 'pages#home'
  # resources :users
  resources :woofs
  get '/login' => 'sessions#new' # sign in form
  post '/login' => 'sessions#create' # sign in action
  delete '/logout' => 'sessions#destroy' # sign out
  get '/contact' => 'pages#contact'
  get  '/about' => 'pages#about'

  resources :users do
   member do
     get :following, :followers
   end
 end

 resources :relationships
end
