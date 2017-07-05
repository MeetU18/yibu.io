module Voteable
  extend ActiveSupport::Concern

  included do
    has_many :votes, foreign_key: 'voteable_id'
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

  def up_voted_by? user
    up_votes.where(user: user).exists?
  end

  def down_voted_by? user
    down_votes.where(user: user).exists?
  end
end