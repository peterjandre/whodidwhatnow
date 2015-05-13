class Person < ActiveRecord::Base
  validates :full_name, presence: true, uniqueness: true
  
  has_many :bios
  has_many :answers
  has_many :users, through: :answers

  accepts_nested_attributes_for :answers

  scope :ready_for_game, -> { where("bio_count = 5")}

end
