class Vote < ApplicationRecord
  belongs_to :voteable, class_name: 'Topic', foreign_key: 'voteable_id' # current only support topic as 'voteable'
  belongs_to :user

  enum value: {down: -1, unvote: 0, up: 1}

  after_save :refresh_voteable_score_background

  private

  def refresh_voteable_score_background
    voteable.refresh_score_background if saved_change_to_value?
  end
end
