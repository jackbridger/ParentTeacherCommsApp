class AddTeacherNameToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :Teacher_name, :string
  end
end
