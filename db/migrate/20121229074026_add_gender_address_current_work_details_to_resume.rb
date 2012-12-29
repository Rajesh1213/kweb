class AddGenderAddressCurrentWorkDetailsToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :gender, :string
    add_column :resumes, :current_employer, :string
    add_column :resumes, :designation, :string
    add_column :resumes, :company_location, :string
    add_column :resumes, :technology, :string
  end
end
