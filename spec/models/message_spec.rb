require 'rails_helper'
describe Message do

  describe '#create' do

    before do
      @user = create(:user)
      @group = create(:group)
      create(:member, user: @user, group: @group)
    end

    it 'is valid with a message' do
      message = build(:message, image: "")
      expect(message).to be_valid
    end

    it 'is valid with a image' do
      message = build(:message, content: nil)
      expect(message).to be_valid
    end

    it 'is valid with content and image' do
      message = build(:message)
      expect(message).to be_valid
    end

    it 'is invalid without content and image' do
      message = build(:message, content: nil, image: nil)
      message.valid?
      expect(message.errors[:content]).to include("を入力してください")
    end

    it 'is invalid without user_id' do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user_id]).to include("を入力してください")
    end

    it 'is invalid without content and image' do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group_id]).to include("を入力してください")
    end
  end
end
