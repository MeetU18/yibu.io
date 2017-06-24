class ScoreWorker
  include Sidekiq::Worker

  def perform(scoreable_id, scoreable_type, *score_calculation_args)
    scoreable = scoreable_type.classify.constantize.find(scoreable_id)
    if scoreable.score_calculation_args != score_calculation_args
      scoreable.refresh_score
    end
  end
end
