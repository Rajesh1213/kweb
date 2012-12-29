class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :views, :null => false, :default => 0
      t.integer :downloads, :null => false, :default => 0
      t.integer :contacts, :null => false, :default => 0
      t.date :view_date, :null => false, :default => Time.now
      t.integer :job_post_id, :null => false, :default => ""
      t.integer :user_id, :null => false, :default => "" # user id of job_seeker

      t.timestamps
    end

    add_index :profiles, :job_post_id, :unique => true
    add_index :profiles, :user_id, :unique => true
  end
end
