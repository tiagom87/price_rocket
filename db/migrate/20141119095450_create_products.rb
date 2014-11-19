class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :html
      t.integer :start_price
      t.integer :end_price
      t.integer :units
      t.string :slug

      t.timestamps null: false
    end
  end
end
