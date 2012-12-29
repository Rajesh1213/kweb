class ChangeDateOfBirthColumnTypeInResume < ActiveRecord::Migration
  def up
  	change_column	:resumes, :date_of_birth, :date, :default => Time.now
  end

  def down
  end
end
