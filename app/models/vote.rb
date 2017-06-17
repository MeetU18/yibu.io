class Vote < ApplicationRecord
  belongs_to :voteable, class_name: 'Topic', foreign_key: 'voteable_id' # current only support topic as 'voteable'
  belongs_to :user

  enum value: {down: -1, unvote: 0, up: 1}
end
