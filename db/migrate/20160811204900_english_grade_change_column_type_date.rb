class EnglishGradeChangeColumnTypeDate < ActiveRecord::Migration[5.0]
  def up
    change_column :english_grades, :grade_date, :datetime
  end

  def down
    change_column :english_grades, :grade_date, :date
  end
end
