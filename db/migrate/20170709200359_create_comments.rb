class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.string :ancestry, index: true
      t.text :content
      t.belongs_to :topic, null: true, index: true

      t.timestamps
    end
  end
end
