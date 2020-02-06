class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.string :name
      t.references :product, foreign_key: true
      t.decimal :price, precision: 10, scale: 2
      t.decimal :cost, precision: 10, scale: 2

      t.timestamps
    end
  end
end
