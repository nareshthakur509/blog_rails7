Rails.application.routes.draw do
  # resources :subscriptionplans
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :posts do
    resources :comments
  end
  
  resources :subscriptions
  resources :checkouts
  resources :charges, only: [:new, :create]
   get "/success" ,to: "success#show"
  resources :subscribers

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "posts#index"

  root "subscribers#new"

end
