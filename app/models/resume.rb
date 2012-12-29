class Resume < ActiveRecord::Base
  attr_accessible :company_location, :current_employer, :date_of_birth, :designation, :email_id, :experience, :gender, :name, :phone_number, :summary, :technology
  validates :phone_number, :length => {:is => 10}, :numericality => { :only_integer => true }
  belongs_to	:user
end
