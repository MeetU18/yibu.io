class AddColumnScoreToTopics < ActiveRecord::Migration[5.0]
  def change
    # only support postgres
    add_column :topics, :score, :decimal, precision: 11, scale: 7, default: 0
    add_index :topics, :score
  end
end
