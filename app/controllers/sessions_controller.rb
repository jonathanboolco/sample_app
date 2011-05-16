class SessionsController < ApplicationController

  #before_filter :force_ssl
  
  def new
    @title = "Sign in"
  end
  
  def create
    
    user = User.authenticate(params[:session][:email], params[:session][:password])

    if user.nil?
        flash.now[:error] = "Invalid email/password combination."
        @title = "Sign in"
        render 'new'
    else
        sign_in user
        redirect_to user
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
