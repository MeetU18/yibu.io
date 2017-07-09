Rails.application.routes.draw do
  resources :topics, only: [:index, :show, :new, :create] do
    member do
      post 'up_vote', to: 'topics#up_vote'
      post 'down_vote', to: 'topics#down_vote'
      delete 'unvote', to: 'topics#unvote'
    end
    collection do
      post 'preview', to: 'topics#preview'
    end
  end

  devise_for :users, controllers: {sessions: 'users/sessions'}


  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'topics#index'
end
