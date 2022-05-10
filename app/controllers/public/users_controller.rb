class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image )
  end
end
