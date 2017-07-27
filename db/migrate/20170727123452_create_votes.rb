class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.integer :votable_id
      t.string :votable_type
      t.boolean :vote, null: false

      t.timestamps
    end
  end
end
