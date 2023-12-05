class AddBirthDateasDateToBabies < ActiveRecord::Migration[7.1]
  def change
    add_column :babies, :birth_date, :date
  end
end
