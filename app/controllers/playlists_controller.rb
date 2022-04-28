class PlaylistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_playlist, only: %i[ show edit destroy ]

  def index
    @playlists = current_user.playlists
  end

  def show
  end

  def new
    @playlist = current_user.playlists.new
  end

  def create
    @playlist = current_user.playlists.build(playlist_params)

    @playlist.user = current_user

    if @playlist.save
      redirect_to root_path
    else
      render :new, notice: "Failed to create playlist #{@playlist.title}"
    end
  end

  def edit
  end

  def destroy
    @playlist.destroy

    redirect_to root_path, notice: "playlist deleted successfully"
  end

  def update
    @playlist.update(playlist_params)

    redirect_to root_path
  end


  private

  def set_playlist
    @playlist = current_user.playlists.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:color, :name, :cover_image)
  end
end
