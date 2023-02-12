Rails.application.routes.draw do
  root "homes#top"
  
  #ゲストログイン
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end

  #会員側のルーティング設定
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
  }

  get "/home/about" => "homes#about", as: "about"
  scope module: :customers do
    resources :points, only: [:index,:show,:edit,:new,:create,:destroy,:update] do
      resources :point_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:index,:show,:edit,:update] do
    end
  end
  get 'search' => 'customers/points#search'

  #管理者側のルーティング設定
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'
    resources :customers,only: [:index,:show,:edit,:update]
  end

end
