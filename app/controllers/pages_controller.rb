class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

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
    @key_memories.where.not(event: "").each do |key_memory|
      timeline_event = {
        days: (key_memory.memory.date - key_memory.baby.birth_date).to_i,
        event: key_memory.event,
        memory: key_memory.memory,
        baby: key_memory.baby,
        margin: ((key_memory.memory.date - key_memory.baby.birth_date).to_i * 2)
      }
      @timeline << timeline_event
    end

    @timeline.sort_by! { |event| event[:days] }
  end
end
