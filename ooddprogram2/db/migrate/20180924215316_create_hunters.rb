class CreateHunters < ActiveRecord::Migration[5.0]
  def change
    create_table :hunters do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :hunters, :user_id
  end
end
