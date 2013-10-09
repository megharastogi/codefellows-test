class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :check_auth_token

 	def check_auth_token
 		if params[:auth_token]
 			@user = User.find_by_authentication_token(params[:auth_token])
 			if @user
 				sign_in("user", @user)
 			end
 		end
 	end
end
