class Vote < ApplicationRecord
  belongs_to :voteable, polymorphic: true
  belongs_to :user, dependent: :destroy

  enum value: {down: -1, unvote: 0, up: 1}

  after_save :refresh_voteable_score_background

  private

  def refresh_voteable_score_background
    voteable.refresh_score_background if saved_change_to_value?
  end
end
