class UserController < ApplicationController

  def edit
  end

  def update
    redirect_to action: :index
  end
end
