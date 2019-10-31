class RmLowUpInCompanyAddIdsInUsers < ActiveRecord::Migration[5.0]
  def change
    #remove old fields from Table companies
    remove_column :companies, :size_low_bd, :integer
    remove_column :companies, :size_up_bd, :integer
    remove_column :companies, :revenue_low_bd, :integer
    remove_column :companies, :revenue_up_bd, :integer

    #add_new_foreign keys for hunter and realtor in Table users
    add_column    :users,     :hunter_id, :integer, index: true
    add_column    :users,     :realtor_id, :integer, index: true

    #add new fields into Table companies
    add_column    :companies, :revenue, :string
    add_column    :companies, :size, :string
  end
end
