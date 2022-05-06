class SearchController < ApplicationController
  def index
    if params[:query].blank?
      redirect_to root_path and return
    else
      @param = params[:query].downcase
      @songs = Song.all.where("lower(title) like :search", search: "%#{@param}%")
    end
  end
end
