class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]

  def index
    @movies = Movie.all
  end

  def show
    @comments = @movie.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = current_user.movies.build(movie_params)

    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      set_categories
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Movie was successfully updated.'
    else
      set_categories
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy!
    redirect_to movies_url, notice: 'Movie was successfully destroyed.'
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def authorize_user!
    redirect_to @movie, alert: 'Not authorized' unless @movie.user == current_user
  end

  def movie_params
    params.require(:movie).permit(:title, :synopsis, :year, :duration, :director, :poster, category_ids: [])
  end
end
