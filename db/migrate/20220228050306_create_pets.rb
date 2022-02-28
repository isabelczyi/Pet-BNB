class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :location
      t.float :price
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.string :name

      t.timestamps
    end
  end
end
