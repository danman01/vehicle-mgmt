class AdminController < ApplicationController
  def login
    session[:user_id] = nil
  	if request.post?
  		user = User.authenticate(params[:myid], params[:password])
  		if user
  		  if user.role == "admin"
  			session[:user_id] = user.id
  			uri = session[:original_uri]
  			session[:original_uri]=nil
  			redirect_to(:action=>'index')
			  else
			    flash.now[:notice] = "#{user.user_fname}, you are not an admin!"
    		end
  		else
  			flash.now[:notice] = "invalid user / password combo"
  		end
  	end
  end

  def logout
  	session[:user_id] = nil
  	flash[:notice] = 'Logged Out'
  	redirect_to(:action => 'login')
  end

  def index
  @user=User.find_by_myid(session[:user_id])
  if @user
  if @user.hashed_password.blank?
  	flash.now[:notice]= "you need to set a password! <a href='/users/edit/#{@user.myid}'>click</a>"
  else
  puts "Logged in successfully"
  end
  else
	flash[:notice]='you must be an admin'
	redirect_to '/'
  end
  end
  
  

end
