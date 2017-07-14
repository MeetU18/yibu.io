class RemoveColumnTagsFromTags < ActiveRecord::Migration[5.1]
  def change
    # remove wrong column created by mistakes
    remove_column :tags, :tags, :datetime
  end
end
