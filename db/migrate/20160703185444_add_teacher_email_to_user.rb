class AddTeacherEmailToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :teacher_email, :string
  end
end
