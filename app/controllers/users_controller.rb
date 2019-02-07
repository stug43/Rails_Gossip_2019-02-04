# frozen_string_literal: true

class UsersController < ApplicationController
  def index; end

  def show
    authenticate_user
    @randomizer = ['https://nsa40.casimages.com/img/2019/02/07/mini_19020711040978981.jpg', 'https://nsa40.casimages.com/img/2019/02/07/mini_190207110601574268.jpg', 'https://nsa40.casimages.com/img/2019/02/07/mini_190207110635325645.jpg', 'https://nsa40.casimages.com/img/2019/02/07/mini_190207111008533839.jpg']
    @user = User.find(params[:id])
  end

  def new; end

  def create
    @user = User.create(password: params[:password])
    @user.city = City.find(params[:city_id])
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.user_name = params[:user_name]
    @user.age = params[:age]
    @user.description = params[:description]
    @user.email = params[:email]
    if @user.save
      @user.save
      redirect_to '/login'
    else
      redirect_to '/users/new'
    end
  end
end
