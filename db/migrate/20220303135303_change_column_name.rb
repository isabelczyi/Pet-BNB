class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :pets, :location, :address
  end
end
