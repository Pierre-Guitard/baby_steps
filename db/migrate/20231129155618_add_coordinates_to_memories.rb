class AddCoordinatesToMemories < ActiveRecord::Migration[7.1]
  def change
    add_column :memories, :latitude, :float
    add_column :memories, :longitude, :float
  end
end
