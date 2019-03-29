Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :games
  resources :tournaments, except: [:index] do
    resources :events, only: [:create, :destroy, :show]
  end
end
