class RmUsersCurrRole < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :curr_role, :integer
  end
end
