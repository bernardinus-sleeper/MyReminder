class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.text :isi_email
      t.datetime :waktu_reminder
      t.string :occurance
      t.datetime :waktu_berakhir
      t.references :task

      t.timestamps
    end
    add_index :reminders, :task_id
  end
end
