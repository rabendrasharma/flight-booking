class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.string :number
      t.integer :origin
      t.integer :destination
      t.integer :coach_id
      t.time :departure_time
      t.text :fares_obj
      t.integer :airplane_type_id

      t.timestamps
    end
  end
end
