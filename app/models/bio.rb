class Bio < ActiveRecord::Base
  validates :text, presence: true

  belongs_to :person
  
  has_many :choices
  has_many :users, through: :choices

  belongs_to :question
end
