class ChangeDateOfBirthColumnTypeToDateInResumes < ActiveRecord::Migration
  def up
  	add_column	  :resumes, :previous_company, :string
  	change_column :resumes, :date_of_birth, :date, :default => Time.now
  	Resume.all.each do |resume|
  	  if resume.date_of_birth.blank?
  	  	resume.update_attribute(:date_of_birth, Time.now)
  	  end
  	end
  end

  def down
  end
end
