class MathsGradeChangeColumnType < ActiveRecord::Migration[5.0]
  def up
    change_column :maths_grades, :feedback, :text
  end

  def down
    change_column :maths_grades, :feedback, :string
  end
end
