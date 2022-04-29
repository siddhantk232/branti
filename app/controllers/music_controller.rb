class MusicController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create ]

  def index
    @songs = Song.latest
    @playlists = current_user.playlists
    @genres = Genre.all
  end

  def new
    @song = current_user.songs.new
  end

  def create
    @song = current_user.songs.build(song_params)

    if @song.save
      redirect_to root_path, notice: "Your music is uploaded!"
    else
      render :new, notice: "Music upload failed."
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :cover_image, :music_file, :color)
  end
end
