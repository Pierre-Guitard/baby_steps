class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @memories = Memory.all
    @memories = Memory.order(date: :desc)
    @babies = Baby.all
    @key_memories = KeyMemory.all
  end
end
