class SessionsController < ApplicationController
	skip_before_filter :logged_in
	
	def new  
	end  

  def create  
		if params[:password] == "pingpong!"
    	session[:password] = params[:password]  
    	flash[:notice] = "Successfully logged in"
    	redirect_to root_path
		else
			flash[:notice] = "Wrong password!"
    	redirect_to login_path 
		end
  end  

  def destroy 
    reset_session
    flash[:notice] = "Successfully logged out"
    redirect_to login_path
  end
end
