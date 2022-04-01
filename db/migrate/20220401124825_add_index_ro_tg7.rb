class AddIndexRoTg7 < ActiveRecord::Migration[6.1]
  def change
    add_index :tgt7s, [:month, :region]
  end
end
