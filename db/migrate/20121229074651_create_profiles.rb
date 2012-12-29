class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :views
      t.integer :downloads
      t.integer :contacts
      t.datetime :view_date
      t.integer :job_post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
