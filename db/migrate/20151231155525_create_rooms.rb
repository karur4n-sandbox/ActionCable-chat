class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.boolean :filled, default: false, null: false

      t.timestamps
    end
  end
end
