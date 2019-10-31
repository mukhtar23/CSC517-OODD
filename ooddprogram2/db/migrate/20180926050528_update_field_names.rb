class UpdateFieldNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :companies, :low_bd, :size_low_bd
    rename_column :companies, :up_bd, :size_up_bd
    rename_column :companies, :revenue, :revenue_up_bd
    add_column    :companies, :revenue_low_bd, :integer
    rename_column :users, :ct_method, :contact_method
  end
end
