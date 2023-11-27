class CreateKeyMemories < ActiveRecord::Migration[7.1]
  def change
    create_table :key_memories do |t|
      t.text :description
      t.references :memory, null: false, foreign_key: true
      t.references :baby, null: false, foreign_key: true

      t.timestamps
    end
  end
end
