class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.integer :voteable_id
      t.string :voteable_type
      t.boolean :vote, null: false

      t.timestamps
    end
  end
end
