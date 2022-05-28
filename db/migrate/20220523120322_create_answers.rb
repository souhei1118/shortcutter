class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :answer_manager_id
      t.integer :quiz_id
      t.timestamps
    end
  end
end
