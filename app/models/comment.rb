class Comment < ApplicationRecord
  belongs_to :user, -> {with_deleted}
  belongs_to :topic, optional: true

  validates :user, :content, presence: true

  has_ancestry
end
