class CreateMathsGrades < ActiveRecord::Migration[5.0]
  def change

    create_table :maths_grades do |t|
      t.references :teacher, references: :users
      t.references :student, references: :users
      t.string :title
      t.string :subcategory
      t.string :performance_grade
      t.string :feedback
      t.date :grade_date

      t.timestamps
    end
    change_column :maths_grades, :feedback, :text
    add_foreign_key :maths_grades, :users, column: :teacher_id
    add_foreign_key :maths_grades, :users, column: :student_id
  end
end
