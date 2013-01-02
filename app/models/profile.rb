class Profile < ActiveRecord::Base
  attr_accessible :contacts, :downloads, :job_post_id, :user_id, :view_date, :views
  belongs_to	:user
  has_many  :profile_views
end
