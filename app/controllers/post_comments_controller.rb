class PostCommentsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.movie_id = movie.id
    if comment.save
      flash[:notice] = 'You have created comment successfully.'
      redirect_to '/movies'
    else
      redirect_to '/movies'
    end
  end
  
  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to movie_path(params[:movie_id])
  end
  
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :user_id, :movie_id)
  end
end