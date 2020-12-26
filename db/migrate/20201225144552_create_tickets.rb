class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :pnr_number
      t.string :seat_number
      t.integer :seat_type
      t.integer :route_id
      t.integer :reservation_id
      t.string :passenger_name
      t.string :email
      t.string :mobile_number
      t.integer :booked_by

      t.timestamps
    end
  end
end
