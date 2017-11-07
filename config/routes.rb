Rails.application.routes.draw do

  root to: 'posts#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

    get 'following/:id', to: 'devise/users#following', as: 'following'
    get 'followers/:id', to: 'devise/users#following', as: 'followers'

    # get 'users/all', to: 'users#index'
  put 'users_all/remove', to: 'users#remove'
  resources :users_all, controller: 'users', only: [:index, :show, :update] do
    get 'profile', on: :collection
  end

  resources :posts

  resources :tags, param: :hashtagurl

  resources :relationships, only: [:create, :destroy]

end
