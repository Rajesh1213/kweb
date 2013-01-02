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

  def increase_view_count(current_user,job_seeker_user_id)
  	profile = Profile.find_by_user_id(job_seeker_user_id)
  	if profile.blank?
  	  profile = Profile.new
  	  profile.views = 1
  	  profile.user_id = job_seeker_user_id
  	  profile.recruiter_id = current_user.id
  	  profile.view_date = Time.now
  	  profile.save
  	else
  	  profile.update_attribute(:views, (profile.views + 1))
  	  profile.update_attribute(:recruiter_id, current_user.id)
  	end
  	create_profile_view(current_user,profile.id)
  end

  def create_profile_view(current_user,profile_id)
  	profile_view = ProfileView.new
  	profile_view.profile_id = profile_id
  	profile_view.user_id = current_user.id
  	profile_view.view_date = Time.now
  	profile_view.save
  end

end
