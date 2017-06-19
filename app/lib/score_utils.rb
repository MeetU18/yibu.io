module ScoreUtils

  module_function
  # details http://www.evanmiller.org/deriving-the-reddit-formula.html
  # return: double
  def hot_score ups, downs, date
    seconds = date - 1500009635 # first commit
    (Math.log(ups + 1) - Math.log(ups + downs + 2) + seconds / 19543).round(7)
  end
end

