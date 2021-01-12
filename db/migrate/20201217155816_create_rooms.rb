class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.boolean :balcony
      t.references :floor, null: false, foreign_key: trues
      t.timestamps
    end
  end
end
