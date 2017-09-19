class Group < ApplicationRecord
  has_many :messages
  has_many :members, dependent: :destroy
  has_many :users, through: :members

  validates :name, null: false
  validate :add_error_sample

  def add_error_sample
    # nameが空のときにエラーメッセージを追加する
    if name.empty?
      errors.add(:name, "を入力してください")
    end
  end

  def last_message(group)
    @last_message = group.messages.last
    if @last_message.try(:image).present?
      return "画像が投稿されています"
    elsif @last_message.try(:content).present?
      return @last_message.content
    else
      return "メッセージはありません"
    end
  end
end
