class MoviesController < ApplicationController
  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      flash[:notice] = 'You have created movie successfully.'
      redirect_to movie_path(@movie.id)
    else
      @user = User.find(current_user.id)
      @movies = Movie.all
      render :index
    end
  end

  def index
    @user = User.find(current_user.id)
    @movie = Movie.new
    @movies = Movie.all
  end

  def show
    @movie_new = Movie.new
    @movie = Movie.find(params[:id])
  end
  
  def edit
  end
  
  def destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :body, :user_id)
  end
end