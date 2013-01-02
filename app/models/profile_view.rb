class ProfileView < ActiveRecord::Base
  attr_accessible :profile_id, :user_id, :view_date
  belongs_to	:user
  belongs_to	:profile
end
