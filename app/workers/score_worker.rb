class ScoreWorker
  include Sidekiq::Worker

  def perform(scoreable, *score_calculation_args)
    if scoreable.score_calculation_args != score_calculation_args
      scoreable.refresh_score
    end
  end
end
