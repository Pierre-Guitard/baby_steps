class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @memories = Memory.all
    @memories = Memory.order(date: :desc)
    @babies = Baby.all
    @key_memories = KeyMemory.all
  end

  def timeline
    @babies = Baby.all
    @key_memories = KeyMemory.all
    @timeline = []
    @babies.each do |baby|
      margin = 0
      timeline_baby = []
      baby.key_memories.where.not(event: "").sort_by { |key_memory| key_memory.memory.date }.each do |key_memory|
        timeline_baby_event = {
          days: (key_memory.memory.date - key_memory.baby.birth_date).to_i,
          event: key_memory.event,
          memory: key_memory.memory,
          baby: key_memory.baby,
          margin: (key_memory.memory.date - key_memory.baby.birth_date).to_i - margin
        }
        margin = timeline_baby_event[:margin]
        timeline_baby << timeline_baby_event
      end
      @timeline << timeline_baby
    end
  end
end
