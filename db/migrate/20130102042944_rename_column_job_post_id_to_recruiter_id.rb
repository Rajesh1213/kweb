class RenameColumnJobPostIdToRecruiterId < ActiveRecord::Migration
  def up
  	rename_column	:profiles, :job_post_id, :recruiter_id
  end

  def down
  end
end
