class RemoveUniqueIndexOnCompanyNameInJobPosts < ActiveRecord::Migration
  def up
  	remove_index :job_posts, :company_name
  	add_index :job_posts, :company_name
  end

  def down
  end
end
