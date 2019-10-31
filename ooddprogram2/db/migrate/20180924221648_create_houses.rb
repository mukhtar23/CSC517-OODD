class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.string :location
      t.float :square_ft
      t.integer :year_built
      t.integer :style
      t.float :price
      t.integer :floor
      t.boolean :basement
      t.string :owner
      t.string :contact_info
      t.integer :realtor_id
      t.integer :company_id
      t.string :pic_link

      t.timestamps
    end
    add_index :houses, :realtor_id
    add_index :houses, :company_id
  end
end
