class Car < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :maker_id,               numericality: { other_than: 1,message: "を選択してください" }
    validates :model_year
    validates :mileage,                format: { with: /\A[0-9]+\z/ ,message: "が正しくありません"}
    validates :prefecture_id,          numericality: { other_than: 1,message: "を選択してください" }
    validates :price,                  numericality: { only_integer: true, greater_than_or_equal_to: 10000, less_than_or_equal_to: 99999999 } # 数字のみuser
    validates :car_code, uniqueness: true
    validates :images,                length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
    #validates :user
  end

  ##Association
  #belongs_to: user
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :maker
end
