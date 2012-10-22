class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :email_user
      t.string :judul_task
      t.datetime :tgl_task
      t.text :tempat_task
      t.text :ket_task
      t.string :status
      t.string :kategori

      t.timestamps
    end
  end
end
