class PlaylistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_playlist, only: %i[ show edit destroy update ]

  def index
    if params["type"] == "public"
      @playlists = Playlist.top
      render :top
    else
      @playlists = current_user.playlists
    end
  end

  def show
    @playlists = current_user.playlists
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
      render :new, notice: "Failed to create playlist"
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

    redirect_to playlist_path(@playlist), notice: "Updated successfully"
  end

  def add
    @playlist = current_user.playlists.find(playlist_add_params["playlist_id"])

    begin
      @playlist.songs.find(playlist_add_params["song_id"])
      redirect_to root_path 
    rescue
      @song = Song.find(playlist_add_params["song_id"])

      @playlist.songs << @song

      if @playlist.save 
        redirect_to root_path, notice: "Song added!"
      else
        redirect_to root_path, notice: "Couldn't add this song"
      end
    end
  end


  private

  def set_playlist
    @playlist = current_user.playlists.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:color, :name, :cover_image, :is_public)
  end

  def playlist_add_params
    params.require(:playlists_songs).permit(:song_id, :playlist_id)
  end
end
