class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
      flash[:success] = "会員情報を更新しました"
    else
      @user = User.find(params[:id])
      # flash[:alert] = "ニックネームとメールアドレスは必須です"
      render 'edit'
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:success] = "ありがとうございました。またお気軽にご利用ください。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image )
  end
end
