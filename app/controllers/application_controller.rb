#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  private

    def current_cart 
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
    helper_method :current_cart
    # ...

  protected

    def authorize
      if request.format == Mime::HTML 

        unless User.find_by_id(session[:user_id])

          redirect_to login_url, :notice => "Please log in"

        end

      else

        authenticate_or_request_with_http_basic do |username, password|

          User.authenticate(username, password)

        end

      end
    end
end
