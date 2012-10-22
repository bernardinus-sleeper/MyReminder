class HomeController < ApplicationController

  def index
  session[:user_id] = nil
  #@task=Task.where(:id=>9)
  end
  
  def daftar_member
  end  
  
  def cek_login
   @user = User.find_by_sql("Select id from users where nama like '#{(params[:formLogin][:nama])}' and password like '#{(params[:formLogin][:password])}'").first;
    if(!@user)
      #redirect_to :action =>:gagal_login, :nama =>(params[:formLogin][:nama])
      flash[:notice] = "Nama dan Password anda salah."
      redirect_to(:controller => :home, :action => :index)
    else
      session[:user_id]=@user
      redirect_to(:controller=>:tasks,:action => 'index')
    end
  end
  
  def gagal_login
    @nama=(params[:nama])
  end
  
  def about  
  end
  
end

