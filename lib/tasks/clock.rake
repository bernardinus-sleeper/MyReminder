task "clock" => :environment do
  STDERR.sync = STDOUT.sync = true
  require 'clockwork'   #notice: not including, just requiring

  Clockwork.every 2.minutes, 'kirim-emailnya' do

  #  chek now is due start-end date  and
  #  chek tasks not yet 'selesai'
  #  chek occurance every years or
  #  chek occurance every month or
  #  chek occurance every weeks or
  #  chek occurance every days or
  #  chek no occurance

  reminders = Reminder.find_by_sql("SELECT * FROM `reminders` WHERE task_id not in( select t.id from tasks t where t.status='selesai') and
date(`waktu_berakhir`) >= curdate() and date(`waktu_reminder`)<= curdate() and
((`occurance` = 'Setiap Tahun' and MONTH(curdate())=MONTH(`waktu_reminder`) and DAY(curdate())=DAY(`waktu_reminder`))
or (`occurance` ='Setiap Bulan' and DAY(curdate())=DAY(`waktu_reminder`)) or (`occurance`= 'Setiap Minggu' and DAYOFWEEK(curdate())=DAYOFWEEK(`waktu_reminder`))
or `occurance`='Setiap Hari' or (`occurance`='Tanpa Perulangan' and curdate()=date(`waktu_reminder`)))
 and TIME(waktu_reminder) <= TIME(DATE_ADD(now(), INTERVAL 2 MINUTE)) and TIME(waktu_reminder) > TIME(now())")
  unless  reminders.empty?
    reminders.each do |remind|  
    puts " ada email"
      @task=Task.where(:id=>remind.task_id).first
      @user = @task.email_user
      @title= @task.judul_task
      @content=remind.isi_email
     #kirim emailnya
 #UserMailer.task_email(@user,@title,@content).deliver

     #save report ke delivered
     adaDeliver=Delivered.where({:task_id=>@task.id,:reminder_id=>remind.id}).first
      if adaDeliver.blank?
        adaDeliver=Delivered.new({:task_id=>@task.id,:reminder_id=>remind.id,:lastdelivered=>Time.now.strftime('%Y-%m-%d %H:%M:%S')})
        puts "save waktu:",adaDeliver.lastdelivered.to_s
        adaDeliver.save
      else
        puts "update task",adaDeliver.task_id.to_s
        adaDeliver.update_column("lastdelivered",Time.now.strftime('%Y-%m-%d %H:%M:%S'))
      end
    end
  else
    puts "ndak ada"
  end
  end

  Clockwork.run
end