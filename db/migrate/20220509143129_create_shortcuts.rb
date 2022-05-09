class CreateShortcuts < ActiveRecord::Migration[6.1]
  def change
    create_table :shortcuts do |t|
      t.integer :category_id
      t.string :key
      t.string :name
      t.float :evaluation

      t.timestamps
    end
  end
end
