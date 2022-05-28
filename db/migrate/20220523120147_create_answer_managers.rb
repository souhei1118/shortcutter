class CreateAnswerManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_managers do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
