class CreateTgt7s < ActiveRecord::Migration[6.1]
  def change
    create_table :tgt7s do |t|
      t.string :region
      t.string :month
      t.string :count
      t.string :supply_amount_sum
      t.string :buying_amount_sum
    end
  end
end
