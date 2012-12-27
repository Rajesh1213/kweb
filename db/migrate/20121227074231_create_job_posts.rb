class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.string :company_name
      t.string :company_url
      t.string :contact_email
      t.string :country
      t.string :city
      t.string :job_position
      t.text :job_description

      t.timestamps
    end
  end
end
