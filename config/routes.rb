Rails.application.routes.draw do
  resources :topics do
    member do
      post 'up_vote', to: 'topics#up_vote'
      post 'down_vote', to: 'topics#down_vote'
      delete 'unvote', to: 'topics#unvote'
    end
  end

  devise_for :users


  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'topics#index'
end
