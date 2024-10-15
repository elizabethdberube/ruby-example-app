Rails.application.routes.draw do
   
  root 'welcome#index'
  devise_for :users

  resources :users do
    resources :articles
  end

  
    resources :articles do

      collection do 
        get "by_user/:user_id", to: "by_user"
     end
    resources :comments 
   
    end
 
  get 'welcome/index'

  get '/welcome/tag/:title', to: 'welcome#tag#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

