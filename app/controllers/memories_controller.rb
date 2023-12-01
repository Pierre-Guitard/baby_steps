class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show]

  def new
    @memory = Memory.new
    @parent = current_user
    @babies = Baby.joins(:parents).where(parents: { user: @parent })
    @memory.key_memories.build
    # @babies = @parent.baby_id
    # raise
  end

  def create
    @memory = Memory.new(post_memory)
    @memory.user = current_user
    # raise
    if @memory.save!
      redirect_to memory_path(@memory)
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:memory).permit(:title, :location, :date, :content, :photos, :clips, key_memories_attributes: [:id, :event, :baby_id])
  end
end
