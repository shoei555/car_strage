class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :rememberable

  with_options presence: true do
    validates :employee_num, format: { with: /[0-9]{,6}/ }
    validates :last_name,    format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
    validates :first_name,   format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
    validates :password,     format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, length: { maximum: 10 }
  end

  with_options uniqueness: true do
    validates :employee_num, format: { with: /[0-9]{,6}/, message: 'は既に使用されています' }
  end

  # #Association
  has_many :cars
end
