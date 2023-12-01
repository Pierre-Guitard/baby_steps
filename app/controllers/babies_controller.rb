class BabiesController < ApplicationController
  before_action :set_babies, only: []

  private

  def set_babies
    @baby = Baby.find(params[:id])
  end

  def post_memory
  end
end
