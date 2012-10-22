class AddGmapsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :gmaps, :boolean
  end
end
