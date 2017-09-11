class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.save(user_params)
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
