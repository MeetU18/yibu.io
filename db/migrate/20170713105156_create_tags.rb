class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.datetime :tags, :deleted_at, index: true

      t.timestamps
    end
  end
end
