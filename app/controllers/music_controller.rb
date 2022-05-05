class MusicController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create ]
  before_action :set_song, only: %i[ show edit update ]

  def index
    @songs = Song.latest
    @playlists = current_user&.playlists&.where&.not(id: nil) || []
    @genres = Genre.all
  end

  def show
  end

  def new
    @song = current_user.songs.new
    @genres = Genre.all.select(:title, :id).pluck(:title, :id)
    @albums = current_user.albums.select(:name, :id).pluck(:name, :id)
  end

  def edit
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

  def update
    if @song.update(song_params) 
      redirect_to root_path, notice: "Your music is uploaded!"
    else
      render :edit, notice: "Music update failed.", status: :unprocessable_entity
    end
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :cover_image, :music_file, :color, :album_id, :genre_ids)
  end
end
