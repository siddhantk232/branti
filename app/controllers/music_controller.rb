class MusicController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create ]

  def index
    @songs = Song.latest
    @playlists = current_user&.playlists&.where&.not(id: nil) || []
    @genres = Genre.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = current_user.songs.new
    @genres = Genre.all.select(:title, :id).pluck(:title, :id)
    @albums = current_user.albums.select(:name, :id).pluck(:name, :id)
  end

  def create
    @song = current_user.songs.build(song_params)

    if @song.save
      redirect_to root_path, notice: "Your music is uploaded!"
    else
      render :new, notice: "Music upload failed.", status: :unprocessable_entity
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :cover_image, :music_file, :color, :album_id, :genre_ids)
  end
end
