class AddColumnIntroduceToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :introduce, :text
  end
end
