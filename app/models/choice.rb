class Choice < ActiveRecord::Base
  belongs_to :user
  belongs_to :bio
  belongs_to :question
end
