class Tag < ApplicationRecord
  acts_as_paranoid

  has_many :topics
end
