class SessionsController < ApplicationController
  def new
		if current_user
			redirect_to user_path(current_user)
		end
  end

  def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
    	log_in(@user)
			redirect_to user_path(@user.id)
		else
			flash[:danger] = "ERROR"
			redirect_to "/login"
		end
  end

  def destroy
	if current_user
		session.delete(:user_id)
		redirect_to root_path
	else
		redirect_to "/login"
  end
	end
end
