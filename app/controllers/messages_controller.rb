class MessagesController < ApplicationController

  before_action :set_group, only: [:index, :create]

  def index
    @message = Message.new
    @messages = @group.messages
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージを送信しました。" }
        format.json
      end
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
