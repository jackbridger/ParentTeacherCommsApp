class CreateShortcutTexts < ActiveRecord::Migration[5.0]
  def change
    create_table :shortcut_texts do |t|
      t.references :teacher, references: :users
      t.text :body

      t.timestamps
    end
        add_foreign_key :shortcut_texts, :users, column: :teacher_id
  end
end
