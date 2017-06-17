module Voteable
  extend ActiveSupport::Concern

  included do
    has_many :votes, foreign_key: 'voteable_id'
  end

  ## instance methods

  def votes_count
    votes.sum(:value)
  end
end