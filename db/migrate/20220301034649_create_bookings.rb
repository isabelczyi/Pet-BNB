class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true
      t.datetime :check_in
      t.datetime :check_out
      t.boolean :status

      t.timestamps
    end
  end
end
