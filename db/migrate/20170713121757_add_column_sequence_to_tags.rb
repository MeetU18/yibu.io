class AddColumnSequenceToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :sequence, :integer
    add_index :tags, :sequence, unique: true
  end
end
