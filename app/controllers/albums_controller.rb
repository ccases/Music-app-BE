class AlbumsController < ApplicationController
  before_action :set_album, only:[:edit, :update, :destroy]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to albums_path, notice: "Updated an album"
    else
      flash[:error] = "Blank field"
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_path
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to albums_path
    else
      flash[:error] = "An error was encountered"
      render :new
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :length, :released_at, :kind)
  end

  def set_album
    @album = Album.find(params[:id])
  end
end
