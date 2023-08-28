class Car < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :maker_id
    validates :model_year
    validates :mileage 
    validates :prefecture_id
    validates :price
    validates :car_code, uniqueness: true
    #validates :user
  end

  ##Association
  #belongs_to: user
  #has_many_attached: images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :maker
end
