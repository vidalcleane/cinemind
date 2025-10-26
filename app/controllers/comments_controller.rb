class CommentsController < ApplicationController
  before_action :set_movie

  def create
    @comment = @movie.comments.build(comment_params)
    @comment.user = current_user if user_signed_in?

    if @comment.save
      redirect_to @movie, notice: 'Comentário adicionado!'
    else
      @comments = @movie.comments.includes(:user).ordered
      render 'movies/show', status: :unprocessable_entity
    end
  end

  def destroy
    @comment = @movie.comments.find(params[:id])
    
    if can_delete_comment?(@comment)
      @comment.destroy
      redirect_to @movie, notice: 'Comentário removido!'
    else
      redirect_to @movie, alert: 'Sem permissão.'
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :author_name)
  end

  def can_delete_comment?(comment)
    return false unless user_signed_in?
    comment.user == current_user || @movie.user == current_user
  end
end
