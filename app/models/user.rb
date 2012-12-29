class User < ActiveRecord::Base
  attr_protected
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :type_of_user
  # attr_accessible :title, :body

  # When type of usr is job seeker
  has_one   :resume
  has_one   :profile
  has_many	:skills
  has_many	:qualification_details
  has_many  :languages
  has_many  :experience_details

  # When type of user is recruiter
  has_many  :job_posts
end
