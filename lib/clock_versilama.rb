#
#require 'clockwork'
#include Clockwork
#
#every(2.minutes, 'reminder.deliver') {
#reminders = Reminder.find(:all, :conditions => ["waktu_reminder <= ? and waktu_reminder > ?", Time.now.advance(:minutes => 2), Time.now])
#unless reminders.nil?
#UserMailer.send_later( :deliver_task_reminder, reminders )
#end
     
require File.expand_path('../config/environment', File.dirname(__FILE__))

  module Clockwork
  every(3.seconds, 'reminder.deliver') {
  reminders = Reminder.find(:all, :conditions => ["waktu_reminder <= ? and waktu_reminder > ? and waktu_berakhir >= ?", Time.now.advance(:days => 2), Time.now,Time.now])
  unless   reminders.empty?
    reminders.each do |remind|
    puts remind.isi_email," \n",remind.waktu_reminder
    end
  else
    puts "ndak ada"
  end

  }
           
end
