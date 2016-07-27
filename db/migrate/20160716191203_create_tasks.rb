class CreateTasks < ActiveRecord::Migration[5.0]
  def change

    create_table :tasks do |t|
      t.string :subject
      t.text :task
      t.references :teacher, foreign_key: true
      t.date :due_date
      t.text :description

      t.timestamps
    end
  end
end
