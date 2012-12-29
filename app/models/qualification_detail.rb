class QualificationDetail < ActiveRecord::Base
  attr_accessible :course_name, :degree, :from, :institute, :to, :university, :user_id, :year_of_passout
  belongs_to	:user
end
