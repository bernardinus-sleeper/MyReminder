class AddLatitudeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :latitude, :float
  end
end
