class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show]

  def new
    @memory = Memory.new
    @parent = current_user
    @babies = Baby.joins(:parents).where(parents: { user: @parent })
    @memory.key_memories.build
  end

  def create
    @memory = Memory.new(post_memory)
    @memory.user = current_user
    if @memory.save!
      redirect_to memory_path(@memory)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comments = @memory.comments
    @babies = @memory.babies
    @linked_memories = []
    birth_date = Date.parse(@babies[0].birth_date)
    @age = (@memory.date - birth_date).to_i / 365
    @memory.key_memories.where.not(event: "").each do |key_memory|
      baby = key_memory.baby
      key_memories = KeyMemory.where.not(baby: baby).where(event: key_memory.event)
      linked_memories = key_memories.map { |key_memory| key_memory.memory}
      @linked_memories << linked_memories
    end
    @linked_memories.uniq!
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
    params.require(:memory).permit(:title, :location, :date, :content, key_memories_attributes: [:id, :event, :baby_id], medias: [])
  end
end
