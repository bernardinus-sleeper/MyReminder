class ApplicationController < ActionController::Base
#  before_filter :set_user
#
#  protected
#    def set_user
#      @user = User.find(session[:id]) if @user.nil? && session[:id]
#    end
#
#    def login_required
#      return true if @user
#      access_denied
#      return false
#    end
#
#    def access_denied
#      session[:return_to] = request.request_uri
#      flash[:error] = _Oops. You need to login before you can view that page._
#      redirect_to :controller => _user_, :action => _login_
#    end

  def authorize
    unless session[:user_id]
      flash[:notice] = "Silahkan log in terlebih dahulu"
      redirect_to(:controller => :home, :action => :index)
    end
  end

  #require 'rake'
  #
  ##Rake::Task.clear
  #load Rails.root.join('lib','tasks', 'clock.rake')
  #Rake::Task['clock'].enable

end
