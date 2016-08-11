class EnglishGradeChangeColumnType < ActiveRecord::Migration[5.0]
  def up
    change_column :english_grades, :feedback, :text
  end

  def down
    change_column :english_grades, :feedback, :string
  end
end
