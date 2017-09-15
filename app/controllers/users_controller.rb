class UsersController < ApplicationController

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path,  notice: 'ユーザー情報を更新しました。'
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end
