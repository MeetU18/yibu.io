require 'rails_helper'

RSpec.describe Vote, type: :model do
  it 'default value should be unvote' do
    topic = create :topic
    vote = Vote.create user: create(:user), voteable: topic
    expect(vote.value).to eq('unvote')
  end

  context 'single user vote' do
    it 'double vote should not work' do
      topic = create :topic
      user = create :user

      expect {user.up_vote topic}.to change(topic, :votes_count).by(1)
      expect {user.up_vote topic}.to change(topic, :votes_count).by(0)
    end

    it 'opposite vote should overwrite prev vote' do
      topic = create :topic
      user = create :user

      expect {user.up_vote topic}.to change(topic, :votes_count).by(1)
      expect {user.down_vote topic}.to change(topic, :votes_count).by(-2)
    end

    it 'unvote just cancel vote value' do
      topic = create :topic
      user = create :user

      expect {user.down_vote topic}.to change(topic, :votes_count).by(-1)
      expect {user.unvote topic}.to change(topic, :votes_count).by(1)
    end
  end


  context 'multiple users vote' do
    it 'multiple users up votes' do
      topic = create :topic
      user1 = create :user
      user2 = create :user

      expect {
        user1.up_vote topic
        user2.up_vote topic
      }.to change(topic, :votes_count).by(2)
    end

    it 'multiple users chaos votes' do
      topic = create :topic
      user1 = create :user
      user2 = create :user
      user3 = create :user

      expect {
        user1.up_vote topic
        user2.down_vote topic
        user3.down_vote topic
      }.to change(topic, :votes_count).by(-1)
    end
  end
end
