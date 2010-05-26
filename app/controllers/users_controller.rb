class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  
  layout 'application'
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  def log_out
		@user = User.find(params[:id])
		new = {:logged_in => 0}
		@user.update_attributes(new)
		redirect_to :back
	end
	
	def log_in
		@user = User.find(params[:id])
		new = {:logged_in => 1}
		@user.update_attributes(new)
		redirect_to :back
	end
	
	def login
	   @admins = User.find(:all, :conditions=>["role=?","admin"])
	   @admins.each do |admin|
	     if params[:user][:myid] == admin.myid
	       if params[:user][:password] == admin.password
         
	         redirect_to '/admin_view'
         else
         flash[:error]='wrong password'
         end
      else
        flash[:error]='you are not an admin!'
        
        
      end
     end
      
  
	end
	
	def admin_view
	  
	end
	
	def login_page
	
	end
	
end
