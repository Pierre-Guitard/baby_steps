class AddColorsToModels < ActiveRecord::Migration[7.1]
  def change
    add_column :babies, :color, :string
    add_column :users, :color, :string
  end
end
