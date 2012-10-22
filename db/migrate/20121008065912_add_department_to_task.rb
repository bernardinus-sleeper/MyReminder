class AddDepartmentToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :department, :string
  end
end
