class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_filter :categories, :brands
  helper_method :current_order

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
   devise_parameter_sanitizer.permit(:account_update, keys[:role])
  end

 #Fills the dropdown for our category link on the navbar
  def categories
  	@categories = Category.all
  end

  def brands
  	@brands =  Product.pluck(:brand).sort.uniq
  end	

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  	
end
