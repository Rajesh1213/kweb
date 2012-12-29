class AddGenderAddressCurrentWorkDetailsToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :gender, :string, :null => false, :default => "male"
    add_column :resumes, :current_employer, :string, :null => false, :default => ""
    add_column :resumes, :designation, :string, :null => false, :default => ""
    add_column :resumes, :company_location, :string, :null => false, :default => ""
    add_column :resumes, :technology, :string, :null => false, :default => ""

    add_index :resumes, :company_location
    add_index :resumes, :technology
  end
end
