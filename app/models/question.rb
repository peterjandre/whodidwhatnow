class Question < ActiveRecord::Base
  belongs_to :person
  belongs_to :bio
  belongs_to :user

end
