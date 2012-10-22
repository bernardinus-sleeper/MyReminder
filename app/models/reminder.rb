class Reminder < ActiveRecord::Base
  belongs_to :task
  attr_accessible :isi_email, :occurance, :waktu_berakhir, :waktu_reminder
  validates_presence_of :isi_email,:waktu_berakhir, :waktu_reminder
end
