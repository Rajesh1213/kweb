class Language < ActiveRecord::Base
  attr_accessible :language_name, :user_id
  belongs_to	:user
end
