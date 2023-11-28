class MemoriesController < ApplicationController
  before_action :set_memory, only: []
  
  def new
    @memory = Memory.new
  end

  private
  def set_memory
    @memory = Memory.find(params[:id])
  end
end
