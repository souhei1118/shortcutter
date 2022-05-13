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

    get 'categories'=> 'categories#index'  #ショートカットカテゴリ選択画面

    patch '/users/withdraw' => 'users#withdraw', as: 'withdraw'  #退会確認画面
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'  #退会完了画面
    resources :users,only: [:show, :edit, :update ] do
      member do
        get '/bookmarks' => 'bookmarks#index'
      end

    end

    resources :shortcuts,only: [:index, :show ]
      resources :comments, only: [:create, :destroy ]
      resource :bookmarks, only: [:create, :destroy ]

  end

  # 管理者側のルーティング
  namespace :admin do
    root "homes#top"

    resources :users,only: [:index, :show, :edit, :update ]

    resources :shortcuts

    resources :categories,only: [:index, :create, :edit, :update ]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
