class CreateLayoutDesigns < ActiveRecord::Migration[6.0]
  def change
    create_table :layout_designs do |t|
      t.text :layout_object, :limit => 70000000
      t.string :design_name

      t.timestamps
    end
  end
end
