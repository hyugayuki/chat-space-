class UsersController < ApplicationController

  def edit
  end

  def update
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
