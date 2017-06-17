require 'rails_helper'

RSpec.describe Topic, type: :model do
  context 'validates' do
    let(:topic) {create :topic}
    it 'title cannot be none' do
      topic.title = ""
      topic.validate
      expect(topic.errors[:title]).to_not be_nil
    end

    it 'content cannot be none' do
      topic.content = ""
      topic.validate
      expect(topic.errors[:content]).to_not be_nil
    end
  end

  it 'topic automatic upvoted by author' do
    topic = create :topic
    expect(topic.votes_count).to eq(1)
    expect(topic.votes.first.user).to eq(topic.user)
  end
end
