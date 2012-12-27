class JobPost < ActiveRecord::Base
  attr_accessible :city, :company_name, :company_url, :contact_email, :country, :job_description, :job_position
end
