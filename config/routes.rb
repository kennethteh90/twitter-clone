Rails.application.routes.draw do

  resources :posts do
    resources :tags
  end
  root to: 'posts#index'

end
