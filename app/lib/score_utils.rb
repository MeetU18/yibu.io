module ScoreUtils

  module_function
  # details http://www.evanmiller.org/deriving-the-reddit-formula.html
  # return: double
  def hot_score ups, downs, date
    seconds = date - 1497446400 # first commit
    (Math.log(ups + 1) - Math.log(ups + downs + 2) + seconds.to_f / 19543).round(7)
  end
end

