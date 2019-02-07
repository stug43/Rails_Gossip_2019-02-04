# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) if current_user
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      log_in(@user)
      redirect_to user_path(@user.id)
    else
      flash[:danger] = 'ERROR'
      redirect_to '/login'
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
      redirect_to root_path
    else
      redirect_to '/login'
    end
  end
end
