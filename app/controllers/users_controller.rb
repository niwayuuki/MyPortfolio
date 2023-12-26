class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.page(params[:page]).reverse_order
    @movie = Movie.new
  end

  def show
     @user = User.find(params[:id])
     @movie = Movie.new
     @movies = @user.movies.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end