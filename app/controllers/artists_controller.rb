class ArtistsController < ApplicationController
    before_action :set_artist, only:[:edit, :update, :destroy]

    def index
      @artists = Artist.all
    end
  
    def new
      @artist = Artist.new
    end
  
    def edit
    end
  
    def update
      if @artist.update(artist_params)
        redirect_to artists_path, notice: "Updated an artist"
      else
        flash[:error] = "Blank field"
        render :edit
      end
    end
  
    def destroy
      @artist.destroy
      redirect_to artists_path
    end
  
    def create
      @artist = Artist.new(artist_params)
  
      if @artist.save
        redirect_to artists_path
      else
        flash[:error] = "An error was encountered"
        render :new
      end
    end
  
    private
  
    def artist_params
      params.require(:artist).permit(:name, :formed_at, :bio, :avatar)
    end
  
    def set_artist
      @artist = Artist.find(params[:id])
    end
end
