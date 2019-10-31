class CreateRealtors < ActiveRecord::Migration[5.0]
  def change
    create_table :realtors do |t|
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
    add_index :realtors, :user_id
    add_index :realtors, :company_id
  end
end
