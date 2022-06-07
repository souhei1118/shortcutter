class Public::QuizzesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.page(params[:page]).per(6)
  end
end
