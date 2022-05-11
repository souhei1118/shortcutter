Rails.application.routes.draw do
  root "public/homes#top"
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# ユーザー側のルーティング
  scope module: :public do
    patch '/users/withdraw' => 'users#withdraw', as: 'withdraw'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    resources :users,only: [:show, :edit, :update ] do
      member do
        get '/bookmarks' => 'bookmarks#index'
      end

    end

    resources :shortcuts,only: [:index, :show ] do
      member do
        get '/bookmarks' => 'bookmarks#index'
      end
      resources :comments, only: [:create]
      resource :bookmarks, only: [:create, :destroy ]
    end
  end

  # 管理者側のルーティング
  namespace :admin do
    root "homes#top"

    resources :users,only: [:index, :show, :edit, :update ] do
    end

    resources :shortcuts do
    end

    resources :categories,only: [:index, :create, :edit, :update ] do
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
