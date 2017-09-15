class Group < ApplicationRecord
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
end
