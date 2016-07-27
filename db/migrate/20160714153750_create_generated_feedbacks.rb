class CreateGeneratedFeedbacks < ActiveRecord::Migration[5.0]
  def change
    drop_table :generated_feedbacks
    create_table :generated_feedbacks do |t|
      t.string :performance_grade
      t.references :teacher, foreign_key: true
      t.string :subject
      t.text :auto_feedback
      t.string :subcategory

      t.timestamps
    end
  end
end
