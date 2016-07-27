class CreateEnglishGrades < ActiveRecord::Migration[5.0]
  def change

    create_table :english_grades do |t|
      t.references :teacher, foreign_key: true
      t.references :student, foreign_key: true
      t.string :title
      t.string :subcategory
      t.string :performance_grade
      t.string :feedback
      t.date :grade_date

      t.timestamps
    end
  end
end
