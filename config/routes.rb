Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'pages#index'
  get 'pages/show'
  resources :users, :only => [:show]
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  
end
