class Admin::UsersController < ApplicationController
  def index
    @users = User.all
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
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image, :is_deleted )
  end
end
