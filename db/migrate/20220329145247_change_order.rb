class ChangeOrder < ActiveRecord::Migration[6.1]
  def change
    drop_table :orders
    create_table :orders do |t|
      t.string :metrica_row_id
      t.string :month
      t.integer :count
      t.string :filename
    end
  end
end
