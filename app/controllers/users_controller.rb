class UsersController < ApplicationController
  def show
    @books = @user.books
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def index
    @users = User.all
    @user = current_user
    # @books = @user.books
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
