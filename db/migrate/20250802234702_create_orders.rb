class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.decimal :subtotal
      t.decimal :tax
      t.decimal :total
      t.references :address, null: false, foreign_key: true
      t.string :tracking
      t.string :ship_company
      t.string :ship_type

      t.timestamps
    end
  end
end
