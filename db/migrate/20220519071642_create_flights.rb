class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :start_datetime
      t.integer :flight_duration
      t.integer :departure_airport_id, index: true, foreign_key: true
      t.integer :arrival_airport_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
