class MoviesController < ApplicationController
  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      flash[:notice] = 'You have created movie successfully.'
      redirect_to movie_path(@movie.id)
    else
      @user = User.find(current_user.id)
      @movies = Movie.page(params[:page]).reverse_order
      render :index
    end
  end

  def index
    @user = User.find(current_user.id)
    @movie = Movie.new
    @movies = Movie.page(params[:page]).reverse_order
  end

  def show
    @movie_new = Movie.new
    @movie = Movie.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @movie.post_comments.page(params[:page]).reverse_order
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = 'You have updated movie successfully.'
      redirect_to movie_path(@movie.id)
    else
      render :edit
    end
  end
  
  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to "/movies"
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :body, :user_id)
  end
end