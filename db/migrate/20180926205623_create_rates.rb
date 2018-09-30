class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :post, foreign_key: true, index: true
      t.integer :value, null: false, index: true

      t.timestamps
    end
  end
end
