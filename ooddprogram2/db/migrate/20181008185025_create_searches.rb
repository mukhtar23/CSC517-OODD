class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :location
      t.decimal :max_price
      t.decimal :min_price
      t.decimal :max_footage
      t.decimal :min_footage

      t.timestamps
    end
  end
end
