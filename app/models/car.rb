class Car < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :maker_id,               numericality: { other_than: 1,message: "を選択してください" }
    validates :model_year
    validates :mileage,                numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 } # 数字のみ
    validates :prefecture_id,          numericality: { other_than: 1,message: "を選択してください" }
    validates :price,                  numericality: { only_integer: true, greater_than_or_equal_to: 10000, less_than_or_equal_to: 99999999 } # 数字のみ
    validates :car_code, uniqueness: true
    validates :images,                length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
    # validates :car_inspection                                                  #車検期間
    # validates :displacement                                                    #排気量
    # validates :car_color                                                       #車体色
    # validates :car_fuel                                                        #燃料
    # validates :wheel_drive                                                     #駆動方式
    # validates :user_id
  end
  

  ##Association
  belongs_to :user
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :maker

  #検索機能用のクラスメソッド
  def self.ransackable_attributes(auth_object = nil)
    ["maker_id","model_year","prefecture_id", "name", "mileage","price","car_code",] #検索対象：メーカー、年式、都道府県、車種名、走行距離、本体価格、車台番号
  end
end
