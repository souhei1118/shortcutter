Rails.application.routes.draw do
  root "public/homes#top"
  get '/search' => 'search#index'

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

    resources :users,only: [:show, :edit, :update ] do
      collection do
        get 'unsubscribe'  #退会確認画面
        patch 'withdraw'  #退会完了画面
      end

      member do
        get '/bookmarks' => 'bookmarks#index' #ブックマーク一覧画面
      end

    end

    resources :shortcuts,only: [:index, :show] do
      resources :comments, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
    end

    resources :categories,only: [:index] do
      resources :answer_managers,only: [:show, :create] do
        member do
          get "result" =>"/public/answer_managers#result"
        end

        get "answers" => '/public/answers#create'
      end
    end

    resources :quizzes,only: [:index]

  end

  # 管理者側のルーティング
  namespace :admin do
    root "homes#top"

    resources :users,only: [:index, :show, :edit, :update]

    resources :shortcuts,only: [:new, :index, :show, :edit, :create, :update] do
      resources :comments, only: [:destroy]
      collection do
        get 'categories' => 'shortcuts#category' #ショートカットカテゴリ選択画面
      end
    end

    resources :categories,only: [:index, :create, :edit, :update, :destroy]

    resources :quizzes,only: [:new, :index, :show, :edit, :create, :update] do
      collection do
        get 'categories' => 'quizzes#category' #クイズカテゴリ選択画面
      end
    end

  end

# お問合せフォームルーティング(未ログイン時でも利用可能)
  get  'inquiry'         => 'inquiry#index'     # 入力画面
  get  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  get  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面

  post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
