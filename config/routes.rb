RubyClipper::Application.routes.draw do
  root to: 'visitors#new'

  resources :users, only: [:index, :show, :edit, :update]

  get '/auth/:provider/callback' => 'sessions#create'
  get '/login' => 'sessions#new', as: :login
  get '/logout' => 'sessions#destroy', as: :logout
  get '/auth/failure' => 'sessions#failure'
end
