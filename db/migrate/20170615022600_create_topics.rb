class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :content
      t.references :user

      t.timestamps
    end
  end
end
