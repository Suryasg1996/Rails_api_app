class CreateFloors < ActiveRecord::Migration[6.0]
  def change
    create_table :floors do |t|
      t.references :building, null: false, foreign_key: true
      t.integer :number_of_doors
      t.integer :number_of_windows
      t.integer :number_of_rooms
      t.string :owner_name

      t.timestamps
    end
  end
end
