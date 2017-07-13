Rails.application.routes.draw do

  get 'comments/create'

  get 'comments/index'

  resources :topics, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
    member do
      post 'up_vote', to: 'topics#up_vote'
      post 'down_vote', to: 'topics#down_vote'
      delete 'unvote', to: 'topics#unvote'
    end
    collection do
      post 'preview', to: 'topics#preview'
    end
  end

  get 'tags/:id', to: 'topics#index', as: :tag_topics

  devise_for :users, controllers: {sessions: 'users/sessions'}

  require 'sidekiq/web'
  authenticate :user, lambda {|u| u.admin?} do
    mount Sidekiq::Web => '/sidekiq'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'topics#index'
end
