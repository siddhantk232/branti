class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_album, only: %i[ show edit destroy ]

  def index
    @albums = current_user.albums
  end

  def show
    @playlists = current_user.playlists
  end

  def new
    @album = current_user.albums.new
  end

  def create
    @album = current_user.albums.build(album_params)

    @album.artist = current_user
    
    if @album.save
      redirect_to root_path
    else
      render :new, notice: "Failed to create album #{@album.name}"
    end
  end

  def edit
  end

  def destroy
    @album.destroy

    redirect_to root_path, notice: "Album deleted successfully"
  end

  def update
    album.update(album_params)
    
    redirect_to root_path
  end


  private

  def set_album
    @album = current_user.albums.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :color, :cover_image)
  end
end
