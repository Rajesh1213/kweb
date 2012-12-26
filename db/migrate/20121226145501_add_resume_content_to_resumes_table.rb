class AddResumeContentToResumesTable < ActiveRecord::Migration
  def change
    add_column :resumes, :resume_content, :text
  end
end
