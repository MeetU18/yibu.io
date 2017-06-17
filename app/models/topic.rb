class Topic < ApplicationRecord
  belongs_to :user
  has_many :votes

  validates_presence_of :title, :content, :user_id
end
