class AddTypeOfUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type_of_user, :string, :default => "job_seeker"
    add_index  :users, :type_of_user
  end
end
