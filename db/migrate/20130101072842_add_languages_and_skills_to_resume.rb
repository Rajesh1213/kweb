class AddLanguagesAndSkillsToResume < ActiveRecord::Migration
  def change
  	add_column	:resumes, :languages, :string, :null => false, :default => "English"
  	add_column	:resumes, :skills, :text, :null => false, :default => ""
  end
end
