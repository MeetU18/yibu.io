module Voteable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable
  end

  def up_votes
    votes.where value: :up
  end

  def down_votes
    votes.where value: :down
  end

  ## instance methods

  def votes_count
    votes.sum(:value)
  end

  def vote_by user
    # hit db cache, better than exists? method
    votes.where(user: user).first
  end

  def up_voted_by? user
    vote_by(user)&.up? || false
  end

  def down_voted_by? user
    vote_by(user)&.down? || false
  end
end