class ChangeDescriptionToTypeInKeyMemories < ActiveRecord::Migration[7.1]
  def change
    remove_column :key_memories, :description
    add_column :key_memories, :event, :string
  end
end
