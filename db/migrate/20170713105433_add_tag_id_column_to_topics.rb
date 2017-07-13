class AddTagIdColumnToTopics < ActiveRecord::Migration[5.1]
  def change
    add_reference :topics, :tag, foreign_key: true
  end
end
