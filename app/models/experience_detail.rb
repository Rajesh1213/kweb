class ExperienceDetail < ActiveRecord::Base
  attr_accessible :company_name, :company_url, :from_date, :role, :to_date, :user_id
  belongs_to :user
end
