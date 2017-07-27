class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :question, null: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
