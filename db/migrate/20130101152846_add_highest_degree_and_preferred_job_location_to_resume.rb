class AddHighestDegreeAndPreferredJobLocationToResume < ActiveRecord::Migration
  def change
  	add_column :resumes, :highest_degree, :string, :null => false, :default => ""
  	add_column :resumes, :preferred_job_location, :string, :null => false, :default => ""
  	add_column :resumes, :current_annual_salary, :integer, :null => false, :default => 0

  	add_index :resumes, :highest_degree  	
  end
end
