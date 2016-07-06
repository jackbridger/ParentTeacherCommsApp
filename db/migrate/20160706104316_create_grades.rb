class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.references :student, foreign_key: true
      t.references :teacher, foreign_key: true
      t.text :feedback
      t.integer :percentage_score
      t.string :grade_type
      t.string :grade_letter
      t.date :grade_date
      t.string :subject

      t.timestamps
    end
  end
end
