class DeleteReduntIdsFromUsers < ActiveRecord::Migration[5.0]
  def change
    #remove redunt ids in Table users, these ids are not necessary for has_one relationships
    remove_column    :users,     :hunter_id, :integer
    remove_column    :users,     :realtor_id, :integer
  end
end
