class Tag < ApplicationRecord
  acts_as_paranoid

  validates_presence_of :name, :sequence

  has_many :topics
end
