class CreateMemories < ActiveRecord::Migration[7.1]
  def change
    create_table :memories do |t|
      t.string :date
      t.string :title
      t.text :content
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
