class Topic < ApplicationRecord
  belongs_to :user, -> { with_deleted }

  include Voteable
  include Scoreable

  enum format: [:text, :link]

  validates_presence_of :title, :content, :user_id
  validate :validate_link_format_url, if: :link?

  after_create do
    user.up_vote self
    refresh_score
  end

  def link_url
    URI(content)
  end

  private
  def validate_link_format_url
    begin
      url = URI(content)
    rescue URI::InvalidURIError => e
      errors.add(:content, "格式错误")
      return
    end

    errors.add(:content, "格式错误，链接不能为空") if url.host.blank?
    errors.add(:content, "链接协议必须为 http 或 https") unless /\Ahttps?\z/ =~ url.scheme
  end
end
