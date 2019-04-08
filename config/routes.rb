Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :games
  resources :tournaments, except: [:index] do
    resources :events, only: [:create, :destroy, :show]
  end
  
  resources :matches, only: [:show, :create]
  put 'matches/:id/join_match', to: 'matches#join_match', as: :join_match
  put 'matches/:id/leave_match', to: 'matches#leave_match', as: :leave_match
end
