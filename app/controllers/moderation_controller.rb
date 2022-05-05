class ModerationController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!

  def index
    @songs = Song.where(published: false).order(id: :desc)
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(published: true) 
      redirect_to moderation_index_path, notice: "Music approved!"
    else
      render :edit, notice: "Music couldn't be approved.", status: :unprocessable_entity
    end
  end

  private

  def authorize_user!
    redirect_to root_path unless current_user.is_admin
  end
end
