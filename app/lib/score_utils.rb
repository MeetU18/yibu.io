module ScoreUtils

  module_function

  # details http://www.evanmiller.org/deriving-the-reddit-formula.html
  # return: double
  # according the article, lm(lambda) mean drop rate per hour, origin reddit version is 19543
  def hot_score ups, downs, date, lm: 19543 * 2
    seconds = date - 1497446400 # first commit
    (Math.log(ups + 1) - Math.log(ups + downs + 2) + seconds.to_f / lm).round(7)
  end
end

