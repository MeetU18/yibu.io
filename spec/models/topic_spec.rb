require 'rails_helper'

RSpec.describe Topic, type: :model do
  context 'validates when text format' do
    let(:topic) {create :topic}

    it 'default format is text' do
      expect(topic.format).to eq('text')
    end

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

  context 'validates when link format' do
    let(:topic) {create :topic, format: :link, content: 'http://example.com'}

    it 'support http or https url' do
      topic.content = 'http://example.com'
      expect(topic.valid?).to be_truthy
      topic.content = 'https://example.com'
      expect(topic.valid?).to be_truthy
    end

    it 'not support other protocol' do
      topic.content = 'ftp://example.com'
      expect(topic.valid?).to be_falsey
    end

    it 'content not support non link' do
      topic.content = "not a link"
      expect(topic.valid?).to be_falsey
    end
  end

  it 'topic automatic upvoted by author' do
    topic = create :topic
    expect(topic.votes_count).to eq(1)
    expect(topic.votes.first.user).to eq(topic.user)
  end
end
