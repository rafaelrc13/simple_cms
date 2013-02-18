class ApplicationController < ActionController::Base
  protect_from_forgery
<<<<<<< HEAD

	protected

  def confirm_logged_in 
  	unless session[:user_id]
  		flash[:notice] = "Please log in"	
  		redirect_to(:controller => 'access', :action => 'login')
  		return false 
  	else
  		return true
  	end
  end
	  
=======
>>>>>>> 746d86639f4946d671a38db8dc44fd342d4e29b7
end
