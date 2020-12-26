class CreateAirplaneTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :airplane_types do |t|
      t.string :name
      t.integer :total_seats
      t.integer :layout_design_id

      t.timestamps
    end
  end
end
