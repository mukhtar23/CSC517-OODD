class CreateInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :inquiries do |t|
      t.string :subject
      t.string :message
      t.string :response
      t.integer :hunter_id
      t.integer :house_id

      t.timestamps
    end
    add_index :inquiries, :hunter_id
    add_index :inquiries, :house_id
  end
end
