class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :value, default: 0, null: false
      t.integer :voteable_id, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
