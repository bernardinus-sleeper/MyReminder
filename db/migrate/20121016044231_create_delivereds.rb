class CreateDelivereds < ActiveRecord::Migration
  def change
    create_table :delivereds do |t|
      t.integer :reminder_id
      t.integer :task_id
      t.datetime :lastdelivered
      t.string :status

      t.timestamps
    end
  end
end
