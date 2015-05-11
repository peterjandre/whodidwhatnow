class Person < ActiveRecord::Base
  validates :full_name, presence: true, uniqueness: true
  
  has_many :bios
  has_many :questions
end
