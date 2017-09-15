class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました。'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:group_id])
  end

  def update
    if @group.save(group_params)
      redirect_to :root_path, notice: '変更に成功しました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
