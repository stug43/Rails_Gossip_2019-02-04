module SessionsHelper

	def current_user
		if session[:user_id]
		id = session[:user_id]
    @user = User.find(id)
		end
  end

	def log_in(user)
    session[:user_id] = user.id
  end

	def authenticate_user
		unless current_user
			redirect_to "/login"
		end
	end
end
