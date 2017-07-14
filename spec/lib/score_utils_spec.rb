require 'rails_helper'

RSpec.describe ScoreUtils do
  it "newer score should higher" do
    order = ScoreUtils.hot_score 1, 0, 1.days.ago.to_i
    newly = ScoreUtils.hot_score 1, 0, 1.hour.ago.to_i
    expect(newly).to be > order
  end

  it "higher ups should got higher score" do
    lower = ScoreUtils.hot_score 3, 0, 1.hour.ago.to_i
    higher = ScoreUtils.hot_score 5, 0, 1.hour.ago.to_i
    expect(higher).to be > lower
  end

  it "higher ups can break time limit score" do
    lower = ScoreUtils.hot_score 1, 0, 1.hour.ago.to_i
    higher = ScoreUtils.hot_score 5, 0, 2.hour.ago.to_i
    expect(higher).to be > lower
  end

  it "ups important than downs" do
    lower = ScoreUtils.hot_score 3, 0, 1.hour.ago.to_i
    higher = ScoreUtils.hot_score 20, 4, 1.hour.ago.to_i
    expect(higher).to be > lower
  end
end
