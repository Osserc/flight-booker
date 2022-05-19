class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :passengers_number
      t.integer :flight_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
