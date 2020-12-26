class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :travel_date
      t.integer :origin
      t.integer :destination
      t.integer :total_seats
      t.text :fares_obj
      t.time :departure_time
      t.integer :route_id
      t.integer :airplane_type_id

      t.timestamps
    end
  end
end
