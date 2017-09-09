class MessagesController < ApplicationController

  def index
    @user_id = current_user.id
  end
end
