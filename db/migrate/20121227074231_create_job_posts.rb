class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.string :company_name, :null => false, :default => ""
      t.string :company_url, :null => false, :default => ""
      t.string :contact_email
      t.string :country, :null => false, :default => ""
      t.string :city, :null => false, :default => ""
      t.string :job_position, :null => false, :default => ""
      t.text :job_description, :null => false, :default => ""
      t.integer :user_id, :null => false, :default => ""

      t.timestamps
    end

    add_index :job_posts, :company_name, :unique => true
    add_index :job_posts, :country
    add_index :job_posts, :city
    add_index :job_posts, :user_id
  end
end
