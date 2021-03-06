class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.page(params[:page]).per(7)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path
      flash[:success] = "会員情報を更新しました"
    else
      @user = User.find(params[:id])
      flash[:alert] = "ニックネームとメールアドレスは必須です"
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image, :is_deleted )
  end
end
