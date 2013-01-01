class JobPost < ActiveRecord::Base
  attr_accessible :city, :company_name, :company_url, :contact_email, :country, :job_description, :job_position, :user_id
  belongs_to	:user

  searchable do
	text :city
	text :job_description
	text :job_position
  end
end
