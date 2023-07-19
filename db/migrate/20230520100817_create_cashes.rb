class CreateCashes < ActiveRecord::Migration[7.0]
  def change
    create_table :cashes do |t|
      t.integer :cash_out, default: 0
      t.integer :deposit, default: 0
      t.integer :promo, default: 0
      t.integer :freeplay, default: 0

      t.references :game , null: false, foreign_key: true
      t.timestamps
    end
  end
end
