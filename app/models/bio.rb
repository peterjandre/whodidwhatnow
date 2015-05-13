class Bio < ActiveRecord::Base
  validates :text, presence: true 

  belongs_to :person
  has_many :answers
end
