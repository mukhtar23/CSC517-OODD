class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.integer :house_id
      t.integer :hunter_id
      t.timestamps
    end
  end
end
