class Car < ApplicationRecord
  with_options presence: true do
    validates :maker_id
    validates :maker_maker
    validates :model_year
    validates :mileage,                numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 } # 数字のみ
    validates :prefecture_id,          numericality: { other_than: 1,message: "を選択してください" }
    validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9999,allow_float: true }
    validates :car_code, uniqueness: true
    validates :images,                   length: { minimum: 1, maximum: 6, message: "は1枚以上6枚以下にしてください" }
    validates :car_inspection                                                  #車検期間
    validates :displacement                                                    #排気量
    validates :color_id,                  numericality: { other_than: 1,message: "を選択してください" }  #車体色
    validates :fuel_id,                numericality: { other_than: 1,message: "を選択してください" }  #燃料
    validates :wheeldrive_id,             numericality: { other_than: 1,message: "を選択してください" }  #駆動方式
    validates :user_id
  end
  

  ##Association
  belongs_to :user
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :maker
  belongs_to :color
  belongs_to :wheeldrive
  belongs_to :fuel
  belongs_to :tag


  #検索機能用のクラスメソッド
  def self.ransackable_attributes(auth_object = nil)
    ["maker_id", "model_year", "prefecture_id", "mileage", "price", "car_code", "maker_maker"] 
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["color", "fuel", "images_attachments", "images_blobs", "maker", "prefecture", "tag", "user", "wheeldrive"]
  end

end
