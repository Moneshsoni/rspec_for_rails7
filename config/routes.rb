Rails.application.routes.draw do
  # get 'posts/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, except: :show
  resources :posts
  

  match "/401", to: "users#unauthorized", via: :all, as: :unauthorized
end
