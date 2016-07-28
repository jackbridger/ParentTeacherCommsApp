class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :subject
      t.text :task
      t.references :teacher, references: :users
      t.date :due_date
      t.text :description

      t.timestamps
    end
    add_foreign_key :tasks, :users, column: :teacher_id
  end
end
