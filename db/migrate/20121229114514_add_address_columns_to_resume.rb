class AddAddressColumnsToResume < ActiveRecord::Migration
  def change
  	add_column  :resumes, :address, :text, :null => false, :default => ""
  	add_column	:resumes, :address_city, :string, :null => false, :default => ""
  	add_column	:resumes, :pin_code, :integer

  	add_index  :resumes, :address_city
  end
end
