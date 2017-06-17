class Topic < ApplicationRecord
  belongs_to :user

  include Voteable

  validates_presence_of :title, :content, :user_id

  after_create do
    user.up_vote self
  end
end
