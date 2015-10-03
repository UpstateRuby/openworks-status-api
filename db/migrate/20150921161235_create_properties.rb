class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :thing, index: true, foreign_key: true
      t.string :name
      t.string :value
      t.string :unit
      t.integer :precision

      t.timestamps null: false
    end
  end
end
