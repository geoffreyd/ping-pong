class SessionsController < ApplicationController
	def new  
	end  

  def create  
		if params[:password] == "pingpong!"
    	session[:password] = params[:password]  
    	flash[:notice] = "Successfully logged in"
    	redirect_to "/"
		else
			flash[:notice] = "Wrong password!"
    	redirect_to :controller => 'sessions', :action => 'create' 
		end
  end  

  def destroy  
    reset_session  
    flash[:notice] = "Successfully logged out"
    redirect_to :controller => 'sessions', :action => 'create' 
  end
end
