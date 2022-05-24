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

  # ゲストユーザーログイン時ルーティング処理
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # ユーザー側のルーティング
  scope module: :public do

    patch '/users/withdraw' => 'users#withdraw', as: 'withdraw'  #退会確認画面
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'  #退会完了画面
    resources :users,only: [:show, :edit, :update ] do
      member do
        get '/bookmarks' => 'bookmarks#index' #ブックマーク一覧画面
      end

    end

    resources :shortcuts,only: [:index, :show ] do
      resources :comments, only: [:create, :destroy ]
      resource :bookmarks, only: [:create, :destroy ]
    end

    resources :categories,only: [:index] do
      resources :answer_managers do
        resources :answers
      end
    end

    resources :quizzes,only: [:index, :show, :create ] do

    end
    get 'quizzes/result'
  end

  # 管理者側のルーティング
  namespace :admin do
    root "homes#top"

    resources :users,only: [:index, :show, :edit, :update ]

    get 'shortcuts/categories' => 'shortcuts#category' #クイズカテゴリ選択画面
    resources :shortcuts

    resources :categories,only: [:index, :create, :edit, :update ]

    get 'quizzes/categories' => 'quizzes#category' #クイズカテゴリ選択画面
    resources :quizzes,only: [:new, :index, :show, :edit, :create, :update ]

  end

# お問合せフォームルーティング(未ログイン時でも利用可能)
  get  'inquiry'         => 'inquiry#index'     # 入力画面
  get  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  get  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面

  post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
