class MoviesController < ApplicationController
  def create
    movie = Movie.new(movie_params)
    movie.user_id = current_user.id
    if movie.save
      flash[:notice] = 'You have created movie successfully.'
      redirect_to movie_path(movie.id)
    else
      render :index
    end
  end
  
  def index
  end
  
  def show
  end
  
  private

  def movie_params
    params.require(:movie).permit(:title, :body, :user_id)
  end
end
