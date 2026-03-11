class UsersController < ApplicationController
  def new
  end

  def create
  @user = User.new
  @user.username = params["username"]
  @user.email = params["email"]
  @user.password = params["password"]

  if @user.save
    redirect_to login_path
  else
    redirect_to signup_path
  end
end
end

