class GenresController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: %i[ edit destroy ]
  before_action :set_genre, only: %i[ show edit destroy ]

  def index
    @genres = Genre.all
  end

  def show
    @playlists = current_user.playlists
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to root_path
    else
      render :new, notice: "Failed to create genre #{@genre.title}"
    end
  end

  def edit
  end

  def destroy
    @genre.destroy

    redirect_to root_path, notice: "Genre deleted successfully"
  end

  def update
    @genre.update(genre_params)

    redirect_to root_path
  end


  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:color, :title, :cover_image)
  end

  def authorize_user!
    redirect_to root_path unless current_user.is_admin
  end
end
