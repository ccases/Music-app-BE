class TracksController < ApplicationController
  before_action :set_track, only:[:edit, :update, :destroy]

  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
  end

  def edit
  end

  def update
    if @track.update(track_params)
      redirect_to tracks_path, notice: "Updated an track"
    else
      flash[:error] = "Blank field"
      render :edit
    end
  end

  def destroy
    @track.destroy
    redirect_to tracks_path
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to tracks_path
    else
      flash[:error] = "An error was encountered"
      render :new
    end
  end

  private

  def track_params
    params.require(:track).permit(:name, :credits)
  end

  def set_track
    @track = Track.find(params[:id])
  end
end
