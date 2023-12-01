class ChangeDatetoDateInMemories < ActiveRecord::Migration[7.1]
  def change
    remove_column :memories, :date, :date
  end
end
