  def login
    return unless request.post?
    self.current_user = User.ldap_authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
        # store in cookie the module where the user logs in.
        cookies[:module] = {:value => params[:select][:module], :expires => self.current_user.remember_token_expires_at}
      end
      flash[:notice] = "Logged in successfully"
    else
      flash[:error] = "Wrong login credentials !"
    end
  end
