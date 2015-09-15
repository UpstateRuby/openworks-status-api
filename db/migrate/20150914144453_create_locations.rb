class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name

      t.timestamps null: false
    end

    add_reference :things, :location, index: true, foreign_key: true
  end
end
