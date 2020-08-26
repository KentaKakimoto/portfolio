Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { registrations: 'registrations' } 
  root 'pages#index'
  get 'pages/show'
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :users, :only => [:show]
end
