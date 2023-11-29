class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show]

  def new
    @memory = Memory.new
  end

  def create
    @memory = Memory.new(post_memory)
    @memory.user = current_user
    @memory.save
  end

  def show
    @comments = @memory.comments
    @babies = @memory.babies
    if @memory.geocode
      @markers = [
        lat: @memory.geocode[0],
        lng: @memory.geocode[1]
      ]
    end
  end

  private

  def set_memory
    @memory = Memory.find(params[:id])
  end

  def post_memory
    params.require(:memory).permit(:title, :location, :date, :content)
  end
end
