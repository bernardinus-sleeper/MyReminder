class AddLongitudeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :longitude, :float
  end
end
