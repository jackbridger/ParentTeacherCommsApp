class CreateEnglishGrades < ActiveRecord::Migration[5.0]
  def change


    create_table :english_grades do |t|
      t.references :teacher, references: :users
      t.references :student, references: :users
      t.string :title
      t.string :subcategory
      t.string :performance_grade
      t.string :feedback
      t.date :grade_date

      t.timestamps
    end
        add_foreign_key :english_grades, :users, column: :teacher_id
    add_foreign_key :english_grades, :users, column: :student_id
  end
end
