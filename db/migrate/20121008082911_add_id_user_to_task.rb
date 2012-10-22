class AddIdUserToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :id_user, :int
  end
end
