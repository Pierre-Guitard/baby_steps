class RemoveBirthDateFromBabies < ActiveRecord::Migration[7.1]
  def change
    remove_column :babies, :birth_date
  end
end
