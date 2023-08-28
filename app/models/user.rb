class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :validatable,:rememberable
  
  with_options presence: true do
    validates :employee_num, format: {with:/[0-9]{6}/}
    validates :last_name,    format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/}
    validates :first_name,   format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/}
  end

  with_options uniqueness: true do
    validates :employee_num
  end

end
