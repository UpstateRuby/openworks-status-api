class AddUniqueName < ActiveRecord::Migration
  def change
		add_index :things, :name, unique:true
  end
end
