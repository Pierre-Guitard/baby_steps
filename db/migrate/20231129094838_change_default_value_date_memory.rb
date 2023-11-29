class ChangeDefaultValueDateMemory < ActiveRecord::Migration[7.1]
  def change()
    change_column(:memories, :date, :string, default: Date.today.to_s)
  end
end
