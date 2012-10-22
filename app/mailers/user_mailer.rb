class UserMailer < ActionMailer::Base
    
  def welcome_email()
    @user = 'user'
    @url  = "http://example.com/login"
    mail(:to => "bernardinus.sleeper@gmail.com", :subject => "Subjeknya Aris bisa buat reminder baru",:from=>'aris dunk')
  end

  def task_email(user,title,content)
    @user=user
    @subject=title
    @content=(content)
    @from ="MyRemainder UC Apps";
    mail(:to=>@user, :subject=>@subject,:from=>@from)
  end
end
