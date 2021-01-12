class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.integer :number_of_floors
      t.string :owner_name

      t.timestamps
    end
  end
end
