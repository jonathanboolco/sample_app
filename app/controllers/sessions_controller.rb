class SessionsController < ApplicationController

  #before_filter :force_ssl
  
  def new
    @title = "Sign in"
  end

  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
      
  def create
    
    user = User.authenticate(params[:session][:email], params[:session][:password])

    if user.nil?
        flash.now[:error] = "Invalid email/password combination."
        @title = "Sign in"
        render 'new'
    else
        sign_in user
        redirect_back_or user
    end
    
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
  
  #private
  #
  #def force_ssl
  #  if !request.ssl?
  #    redirect_to :protocol => 'https'
  #  end
  #end

end
