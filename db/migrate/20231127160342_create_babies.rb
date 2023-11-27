class CreateBabies < ActiveRecord::Migration[7.1]
  def change
    create_table :babies do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :birth_date
      t.string :sex

      t.timestamps
    end
  end
end
