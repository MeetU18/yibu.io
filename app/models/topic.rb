class Topic < ApplicationRecord
  belongs_to :user

  include Voteable
  include Scoreable

  enum format: [:text, :link]

  validates_presence_of :title, :content, :user_id
  validates :content, format: /\Ahttps?:\/\/[\S]+\z/, if: :link?

  after_create do
    user.up_vote self
    refresh_score
  end
end
