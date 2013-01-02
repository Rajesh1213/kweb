class Resume < ActiveRecord::Base
  attr_accessible :address, :address_city, :company_location, :current_annual_salary, :current_employer, :date_of_birth, :designation, :email_id, :experience, :gender, :highest_degree, :languages, :name, :pin_code, :phone_number, :preferred_job_location, :previous_company, :resume_content, :skills, :summary, :technology
  validates :phone_number, :length => {:is => 10}, :numericality => { :only_integer => true }
  validates :pin_code, :length => {:in => 6..8}, :numericality => { :only_integer => true }
  belongs_to	:user

  searchable do
	text :address
	text :address_city
	text :company_location
	text :designation
	text :resume_content
	text :skills
	text :summary
	text :technology
	text :highest_degree
	time :updated_at
  end
end
