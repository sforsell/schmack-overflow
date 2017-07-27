class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment, null: false
      t.references :user, index: true
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false

      t.timestamps
    end
  end
end
