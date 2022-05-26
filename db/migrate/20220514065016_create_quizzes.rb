class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.string :choice1
      t.string :choice2
      t.string :choice3
      t.string :choice4
      t.string :answer

      t.timestamps
    end
  end
end
