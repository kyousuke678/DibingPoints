Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  #会員側のルーティング設定
  root "homes#top"
  get "/home/about" => "homes#about", as: "about"

  scope module: :customers do
    resources :points, only: [:index,:show,:edit,:create,:destroy,:update] do
      resources :point_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:index,:show,:edit,:update] do
    end
  end
end
