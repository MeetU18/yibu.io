module Scoreable
  extend ActiveSupport::Concern

  include Voteable

  # return ups, downs, date for score calculation
  def score_calculation_args
    [up_votes.count, down_votes.count, created_at.to_time.to_i]
  end

  def refresh_score
    score = ScoreUtils.hot_score(*score_calculation_args)
    update score: score
  end

  def refresh_score_background
    ScoreWorker.perform_in(5.minutes, self, *score_calculation_args)
  end

  class_methods do
    # return ActiveRecord::Relation
    def sort_by_score
      order(score: :desc)
    end
  end
end