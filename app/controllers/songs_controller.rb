class SongsController < ApplicationController
  before_action :set_song, only: %i[show edit update delete]


  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end


  def show
  end

  def create
    @song = Song.new(song_params)
    if @song.save
    redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
    redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def delete
    @song.destroy
    redirect_to songs_path(@song)
  end


  def set_song
    @song = Song.find(params[:id])
  end


  def song_params
    params.require.(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end