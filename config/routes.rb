Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
  }
  #会員側のルーティング設定
  root "homes#top"
  get "/home/about" => "homes#about", as: "about"

  scope module: :customers do
    resources :points, only: [:index,:show,:edit,:new,:create,:destroy,:update] do
      resources :point_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:index,:show,:edit,:update] do
    end
  end
end
