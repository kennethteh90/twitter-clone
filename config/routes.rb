Rails.application.routes.draw do

  root to: 'posts#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

    get 'following/:id', to: 'devise/users#following', as: 'following'
    get 'followers/:id', to: 'devise/users#following', as: 'followers'

    # get 'users/all', to: 'users#index'
  resources :users_all, controller: 'users', only: [:index, :show] do
    get 'profile', on: :collection
  end

  resources :posts

  resources :tags

  resources :relationships, only: [:create, :destroy]

end
