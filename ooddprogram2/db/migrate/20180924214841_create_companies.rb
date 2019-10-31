class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :address
      t.integer :low_bd
      t.integer :up_bd
      t.integer :year_founded
      t.integer :revenue
      t.text :synopsis

      t.timestamps
    end
  end
end
