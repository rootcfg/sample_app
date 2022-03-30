class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :city
      t.string :quarter
      t.string :string

      t.timestamps
    end
  end
end
