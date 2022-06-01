class Public::HomesController < ApplicationController
  before_action :signed_in?


  def top
    @user = User.new
  end


  private

  #サインインしているかどうか？
  def signed_in?
    # もし管理者がログイン状態を保持していたら管理者TOP画面へ遷移する
    if admin_signed_in?
      redirect_to admin_root_path
      # もしユーザーがログイン状態を保持していたらマイページへ遷移する
    elsif user_signed_in?
      redirect_to user_path(current_user)
    end
  end
end
