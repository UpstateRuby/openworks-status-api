class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name
      t.integer :status
      t.string :reason

      t.timestamps null: false
    end
  end
end
