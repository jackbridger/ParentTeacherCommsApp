class CreateGeneratedFeedbacks < ActiveRecord::Migration[5.0]
  def change

    create_table :generated_feedbacks do |t|
      t.string :performance_grade
      t.references :teacher, references: :users
      t.string :subject
      t.text :auto_feedback
      t.string :subcategory

      t.timestamps
    end
    add_foreign_key :generated_feedbacks, :users, column: :teacher_id
  end
end
