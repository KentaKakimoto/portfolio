Rails.application.routes.draw do
 
  devise_for :users, controllers: { registrations: 'registrations' } 
  root 'pages#index'
  get "users/:id" => "users#show", as: :mypage
  get 'rooms/index' => 'rooms#index'
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
