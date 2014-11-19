class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :email
      t.string :guid
      t.references :product, index: true
      t.integer :price

      t.timestamps null: false
    end
  end
end
