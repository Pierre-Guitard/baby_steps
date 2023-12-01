class AddDatetoMemories < ActiveRecord::Migration[7.1]
  def change
    add_column :memories, :date, :date
  end
end
