class CreateQuizChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_choices do |t|
      t.references :quiz, foreign_key: true
      t.boolean :correct_answer, default: false, null: false
      t.string :choice

      t.timestamps
    end
  end
end
