class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:cart_id] = nil
    redirect_to thanks_url, :notice => "Logged out"
  end
  
  def thanks_page
    @hide_cart = true
  end

end
