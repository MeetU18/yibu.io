class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      # wrong, should not create tags, fixed in after migrations
      t.datetime :tags, :deleted_at, index: true

      t.timestamps
    end
  end
end
