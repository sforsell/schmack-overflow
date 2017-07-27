class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user, index: true
      t.references :question, index: true
      t.string :answer, null: false
      t.boolean :top_answer, default: false

      t.timestamps
    end

    # add_index :answers, [:user, :question], unique: true

  end
end
