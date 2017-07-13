class ChangeVoteToPolymorphic < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :voteable_type, :string
    Vote.update_all voteable_type: 'Topic'
    add_index :votes, [:voteable_type, :voteable_id]
    add_index :votes, [:user_id, :voteable_type, :voteable_id], unique: true
  end
end
