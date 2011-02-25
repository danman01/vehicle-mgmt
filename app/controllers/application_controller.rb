# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

   #before_filter :authorize, :except=>'login'
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  #before_filter :put_current_user_into_model
 
  protected
=begin
def put_current_user_into_model
@user = User.find_by_myid(session[:user_id])
if @user
User.current_user = @user
end
end
=end
  	def authorize
  		unless User.find_by_myid(session[:user_id])
  		    session[:original_uri] = request.request_uri
  			flash[:notice] = "please log in!"
  			redirect_to :controller =>'admin', :action =>'login'
  		end
  	end
  
end
