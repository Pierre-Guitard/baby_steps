require 'time_diff'

class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show]

  def new
    session[:memory_params] ||= {}
    @memory = Memory.new(session[:memory_params])
    @step = session[:step] || 1
    session[:step] = @step
    @parent = current_user
    @babies = Baby.joins(:parents).where(parents: { user: @parent })
    @memory.key_memories.build
  end

  def create
    options = session[:memory_params].deep_merge!(memory_params)
    @memory = Memory.new(options)
    @memory.user = current_user
    @step = session[:step]

    if @step == 2
      empty_cookies

      if @memory.save
        redirect_to memory_path(@memory)
      else
        redirect_to new_memory_path(@memory)
      end

    else
      new_step = @step + 1
      session[:step] = new_step
      redirect_to new_memory_path
    end
  end

  def show
    # raise
    @comments = @memory.comments
    @user2 = User.where(first_name:"maud")
    @babies = @memory.babies
    @linked_memories = []
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

  def memory_params
    params.require(:memory).permit(:title, :location, :date, :content, key_memories_attributes: [:id, :event, :baby_id], medias: [])
  end

  def empty_cookies
    session[:memory_params] = nil
    session[:step] = nil
  end
end
