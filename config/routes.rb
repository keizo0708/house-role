Rails.application.routes.draw do
  devise_for :users
  root to: 'houses#index'
  resources :relationships, only: [:create, :destroy]
  resources :houses do
    get "join" => "houses#join"
    delete "all_destroy" => 'houses#all_destroy'
    resources :roles
  end
end
